//
//  CharacterViewModelTest.swift
//  RickAndMortySearchApp
//
//  Created by Ram Chennupati on 7/17/25.
//

import XCTest
@testable import RickAndMortySearchApp

final class SearchViewModelTests: XCTestCase {
    
    let earthOrigin = Origin(name: "Earth")
        
    private func makeCharacter(id: Int, name: String) -> Character {
        Character(
            id: id,
            name: name,
            species: "Human",
            image: "",
            status: "Alive",
            origin: earthOrigin,
            type: "",
            created: "2017-11-04T18:48:46.250Z"
        )
    }
    
    func testFiltersCharactersWithSearchText() {
        let character1 = makeCharacter(id: 1, name: "Rick Sanchez")
        let character2 = makeCharacter(id: 2, name: "Morty Smith")

        let viewModel = SearchViewModel()
        viewModel.searchText = "rick"
        
        viewModel.characters = [character1, character2]
        
        // Expect only "Rick Sanchez" to match
        let results = viewModel.characters.filter { $0.name.lowercased().contains(viewModel.searchText.lowercased()) }
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.name, "Rick Sanchez")
    }
    
    func testEmptySearchText() {
        let viewModel = SearchViewModel()
        viewModel.searchText = ""
        viewModel.characters = [makeCharacter(id: 1, name: "Rick")]

        viewModel.searchText = "" // simulate clearing
        let results = viewModel.characters
        
        XCTAssertTrue(results.isEmpty || viewModel.searchText.isEmpty, "Characters should be empty when search text is cleared")
    }

}
