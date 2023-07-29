//
//  final_projectTests.swift
//  final_projectTests
//
//  Created by Jackson on 16/08/22.
//

import XCTest
@testable import final_project

class MoviesModelTests: XCTestCase {
    
    func test_should_moviesViewModel_calls_service() throws {
        let model = MoviesModelMock()
        let service = MoviesServiceMock()
        
        let viewModel = MoviesViewModel(movies: model, service: service)
        
        viewModel.getMovies()
        
        XCTAssert(service.didCalledGetMoviesTimes == 1)
    }
}
