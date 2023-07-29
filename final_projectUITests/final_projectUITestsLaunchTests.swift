//
//  final_projectUITestsLaunchTests.swift
//  final_projectUITests
//
//  Created by Jackson on 16/08/22.
//

import XCTest

class final_projectUITestsLaunchTests: XCTestCase {

    override class func setUp() {
            super.setUp()
        }
        
        override class func tearDown() {
            super.tearDown()
        }

        override func setUpWithError() throws {
            continueAfterFailure = false
        }
        
        func test_should_tap_first_movie_and_validateTitle() throws {
            let app = XCUIApplication()
               app.launch()

               // Carregar a collection view
               let collectionLoadedExpectation = expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: app.collectionViews.element, handler: nil)
               wait(for: [collectionLoadedExpectation], timeout: 10)

               // Acessa a primeira celula da collection view e pressiona
               let firstCell = app.collectionViews.cells.element(boundBy: 0)
               firstCell.tap()

               sleep(3) // Only use sleep for debugging purposes or if necessary for synchronization

               // Cria uma variavel para localizar o elemento na tela de titulo
               let godfather = app.staticTexts["mainTitle"]
                
               XCTAssertEqual(godfather.label, "Título: The Godfather")
        }
}
