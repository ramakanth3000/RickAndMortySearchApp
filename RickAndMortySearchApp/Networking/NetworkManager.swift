//
//  NetworkManager.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()

    // Mark NetworkManager as a singleton class
    private init() {}

    func fetch<T: Decodable>(from url: URL) -> AnyPublisher<T, NetworkError> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw NetworkError.apiError
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if error is NetworkError {
                    return .apiError
                } else if error is DecodingError {
                    return .decodingFailed
                } else {
                    return .unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
