//
//  CharacterListView.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)

                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }

                if let error = viewModel.error {
                    Text(error.errorDescription ?? "An unknown error occurred")
                        .foregroundColor(.red)
                        .padding()
                }

                List(viewModel.characters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterRowView(character: character)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Rick & Morty")
        }
    }
}

#Preview {
    CharacterListView()
}
