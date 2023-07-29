//
//  MovieDetails.swift
//  final_project
//
//  Created by Jackson on 16/08/22.
//

import Foundation

class MovieDetailsModel {
    
    func getDetails(movieId: String, completion: @escaping (Data?, Error?) -> Void) -> Void {
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=828ce092ac14611725ef303e95efd77d")!,
           completionHandler: { (data, response, error) in
                completion(data, error)
            }
        ).resume()
    }
}
