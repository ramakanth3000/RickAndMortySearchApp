//
//  RickAndMortySearchAppUITests.swift
//  RickAndMortySearchAppUITests
//
//  Created by Ram Chennupati on 7/17/25.
//

import XCTest

final class RickAndMortySearchAppUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testTypingSearchAndNavigatingToDetail() throws {
        
        // Type text in search field
        let searchField = app.textFields["Search characters"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 3))
        searchField.tap()
        searchField.typeText("Rick")

        // Result's to appear
        let firstResult = app.staticTexts["Rick Sanchez"]
        XCTAssertTrue(firstResult.waitForExistence(timeout: 5))

        // Tap on first result
        firstResult.tap()

        // Verify detail view content
        let speciesLabel = app.staticTexts["Species is Human"]
        XCTAssertTrue(speciesLabel.exists)

        let statusLabel = app.staticTexts["Status is Alive"]
        XCTAssertTrue(statusLabel.exists)

    }
}

