//
//  CharacterDetailView.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
                Group {
                    Text("Species: \(character.species)")
                        .accessibilityLabel("Species is \(character.species)")
                    
                    Text("Status: \(character.status)")
                        .accessibilityLabel("Status is \(character.status)")
                    
                    Text("Origin: \(character.origin.name)")
                        .accessibilityLabel("Origin is \(character.origin.name)")
                    
                    if !character.type.isEmpty {
                        Text("Type: \(character.type)")
                            .accessibilityLabel("type is \(character.type)")
                    }
                    if let created = character.formattedCreatedDate {
                        Text("Created: \(created)")
                            .accessibilityLabel("create on \(created)")
                    }
                    
                    ShareButtonView(character: character)
                }
                .font(.body)
                .foregroundColor(.primary)
            }
            .padding()
        }
        .navigationTitle(character.name)
    }
}

struct ShareButtonView: View {
    let character: Character
    var body: some View {
        HStack {
            // Share Button
            ShareLink(
                item:  "Check out \(character.name) — a \(character.species) from Rick and Morty!\n\(character.image)",
                subject: Text("\(character.name) from Rick & Morty"),
                message: Text("Check out this character from Rick and Morty!"),
                preview: SharePreview(character.name, image: Image(systemName: "person.crop.square"))
            ) {
                Label("Share", systemImage: "square.and.arrow.up")
                    .font(.subheadline)
                    .padding(8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
    }
}

#Preview {
    CharacterDetailView(character: MockData.character)
}
