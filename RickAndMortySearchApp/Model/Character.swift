//
//  Character.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import Foundation

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let species: String
    let image: String
    let status: String
    let origin: Origin
    let type: String
    let created: String
    
    var formattedCreatedDate: String? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        if let date = formatter.date(from: created) {
            return date.formatted(date: .abbreviated, time: .shortened)
        }
        return nil
    }
}

struct Origin: Decodable {
    let name: String
}

struct MockData {
    static let character = Character(
        id: 61,
        name: "Campaign Manager Morty",
        species: "Human",
        image: "https://rickandmortyapi.com/api/character/avatar/61.jpeg",
        status: "Dead",
        origin: Origin(name: "unknown"),
        type: "",
        created: "2017-11-05T11:53:44.737Z"
    )
}
