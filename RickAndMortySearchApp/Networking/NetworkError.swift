//
//  NetworkError.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import Foundation

enum NetworkError: Error {

    case invalidURL
    case decodingFailed
    case apiError
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .decodingFailed:
            return "Failed to decode the data."
        case .apiError:
            return "No results found"
        case .unknown:
            return "An unknown error occurred"
        }
    }
}
