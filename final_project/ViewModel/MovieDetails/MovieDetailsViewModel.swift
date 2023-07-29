//
//  MovieDetails.swift
//  final_project


import Foundation

class MovieDetailsViewModel {
    var movie: MovieDetails?
    var model: MovieDetailsModel
    
    var updateMovieDetails: (() -> Void)?
    
    init(model: MovieDetailsModel) {
        self.model = model
    }
    
    func fetchMovie(movieId: String) {
        model.getDetails(movieId: movieId, completion: { [weak self] data, error in
            let responseData = try? JSONDecoder().decode(MovieDetails.self, from: data!)
            self?.movie = responseData
            self?.updateMovieDetails?()
        })
    }
}
