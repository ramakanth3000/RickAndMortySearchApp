//
//  RickAndMortySearchAppTests.swift
//  RickAndMortySearchAppTests
//
//  Created by Ram Chennupati on 7/17/25.
//

import XCTest
@testable import RickAndMortySearchApp

final class CharacterTests: XCTestCase {

    func testFormattedCreatedDate() {
        
        let character = Character(
            id: 61,
            name: "Campaign Manager Morty",
            species: "Human",
            image: "https://rickandmortyapi.com/api/character/avatar/61.jpeg",
            status: "Dead",
            origin: Origin(name: "unknown"),
            type: "",
            created: "2017-11-05T11:53:44.737Z"
        )

        let formatted = character.formattedCreatedDate

        XCTAssertNotNil(formatted)
        XCTAssertTrue(formatted!.contains("2017") || formatted!.contains("Nov") || formatted!.contains("5"), "Formatted date should include a readable date.")
    }
}
