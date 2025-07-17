//
//  SearchViewModel.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var error: NetworkError?

    private var cancellables = Set<AnyCancellable>()

    init() {
        bindSearch()
    }

    private func bindSearch() {
        $searchText
            .sink { [weak self] searchString in
                self?.fetchCharacters(for: searchString)
            }
            .store(in: &cancellables)
    }

    private func fetchCharacters(for searchString: String) {
        
        guard !searchString.isEmpty else {
            self.characters = []
            self.error = nil
            return
        }
        
        var components = URLComponents(string: "https://rickandmortyapi.com/api/character")
        components?.queryItems = [
            URLQueryItem(name: "name", value: searchString)
        ]

        guard let url = components?.url else {
            self.error = .invalidURL
            return
        }
        
        isLoading = true
        NetworkManager.shared.fetch(from: url)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = error
                    self?.characters = []
                } else {
                    self?.error = nil
                }
            }, receiveValue: { [weak self] (response: CharacterResponse) in
                self?.characters = response.results
            })
            .store(in: &cancellables)
    }
}
