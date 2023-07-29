//
//  MoviesServiceMock.swift
//  final_projectTests
//
//  Created by Jackson on 23/05/23.
//

import Foundation
@testable import final_project

class MoviesServiceMock: MoviesServiceType {
    var didCalledGetMoviesTimes = 0

    func getMovies(completion: @escaping (Data?, Error?) -> Void) {
        didCalledGetMoviesTimes += 1
    }
}
