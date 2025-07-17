//
//  SearchBar.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search characters", text: $text)
                .accessibilityLabel("Character search field")
                .accessibilityHint("Type to search for characters")
                .autocapitalization(.none)
                .disableAutocorrection(true)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .accessibilityLabel("Clear search text")
                .accessibilityIdentifier("ClearSearchButton")
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    SearchBar(text: .constant("Rick"))
        .padding()
    Spacer()
}
