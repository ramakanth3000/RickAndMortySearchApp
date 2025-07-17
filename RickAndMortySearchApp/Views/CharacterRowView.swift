//
//  CharacterRowView.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(character.name).font(.headline)
                Text(character.species).font(.subheadline).foregroundColor(.gray)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(character.name), species \(character.species)")
        .accessibilityHint("Tap to view character details")
    }
}

#Preview {
    CharacterRowView(character: MockData.character)
}
