//
//  MoviesModelMock.swift
//  final_projectTests
//
//  Created by Jackson on 16/08/22.
//

import Foundation
@testable import final_project

class MoviesModelMock: MoviesModelType {
    var movies: [Movies] = []
    var didCalledGetMoviesTimes = 0
    var didCalledSetMoviesTimes = 0
    
    func setMovies(response: Data?) {
        didCalledSetMoviesTimes += 1
    }
    
    func getMovies(completion: @escaping (Data?, Error?) -> Void) {
        didCalledGetMoviesTimes += 1
    }
}
