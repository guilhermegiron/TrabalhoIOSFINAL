//
//  MoviesDetailsController.swift
//  final_project
//

import Foundation
import UIKit

class MovieDetailsController: UIViewController, Coordinating {
     
     var coordinator: Coordinator?
     var viewModel: MovieDetailsViewModel?
     var movieId: String
     
    
    private lazy var cardView: UIView = {
            let view = UIView()
            view.backgroundColor = .darkGray
            view.layer.cornerRadius = 10
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
    
     private lazy var mainTitle: UILabel = {
          let view = UILabel()
          view.textColor = .white
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = movie?.title
          view.accessibilityIdentifier = "mainTitle"
          return view
     }()
     
     private lazy var voteAverage: UILabel = {
          let view = UILabel()
          view.textColor = .white
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = String(movie?.voteAverage ?? 0.0)
          return view
     }()
     
     
     private lazy var voteCount: UILabel = {
          let view = UILabel()
          view.textColor = .white
          view.translatesAutoresizingMaskIntoConstraints = false
          view.text = String(movie?.voteCount ?? 0)
          return view
     }()
     
     private lazy var spinner: UIActivityIndicatorView = {
          let view = UIActivityIndicatorView()
          view.style = .large
          view.translatesAutoresizingMaskIntoConstraints = false
          view.startAnimating()
          return view
     }()
    
    private lazy var overview: UILabel = {
         let view = UILabel()
         view.textColor = .white
         view.numberOfLines = 0
         view.translatesAutoresizingMaskIntoConstraints = false
         view.text = movie?.overview
         return view
    }()
    
    private lazy var data_release: UILabel = {
         let view = UILabel()
         view.textColor = .white
         view.numberOfLines = 0
         view.translatesAutoresizingMaskIntoConstraints = false
         view.text = movie?.releaseDate
         return view
    }()
    
    private let bannerimage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
     
     var movie: MovieDetails? {
          return viewModel?.movie
     }
     
     init(movieId: String) {
          self.movieId = movieId
          super.init(nibName: nil, bundle: nil)
          super.viewDidLoad()
     }
     
     required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
     }
     
     override func viewDidLoad() {
         self.view.backgroundColor = UIColor.black
         
         view.addSubview(cardView)
         cardView.addSubview(mainTitle)
         cardView.addSubview(data_release)
         cardView.addSubview(voteAverage)
         cardView.addSubview(voteCount)
         cardView.addSubview(overview)
         cardView.addSubview(bannerimage)
         
         view.addSubview(spinner)
                 
         cardView.translatesAutoresizingMaskIntoConstraints = false
         mainTitle.translatesAutoresizingMaskIntoConstraints = false
         data_release.translatesAutoresizingMaskIntoConstraints = false
         voteAverage.translatesAutoresizingMaskIntoConstraints = false
         voteCount.translatesAutoresizingMaskIntoConstraints = false
         overview.translatesAutoresizingMaskIntoConstraints = false
         bannerimage.translatesAutoresizingMaskIntoConstraints = false
         spinner.translatesAutoresizingMaskIntoConstraints = false
          
          setupConstraints()
          bindSetup()
     }
     
     func setupConstraints() {
         NSLayoutConstraint.activate([
                     cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                     cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                     cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                     cardView.bottomAnchor.constraint(equalTo: bannerimage.bottomAnchor, constant: 20),
                     
                     mainTitle.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
                     mainTitle.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
                     mainTitle.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
                     
                     data_release.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20),
                     data_release.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
                     data_release.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
                     
                     voteAverage.topAnchor.constraint(equalTo: data_release.bottomAnchor, constant: 20),
                     voteAverage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
                     voteAverage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
                     
                     voteCount.topAnchor.constraint(equalTo: voteAverage.bottomAnchor, constant: 20),
                     voteCount.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
                     voteCount.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
                     
                     overview.topAnchor.constraint(equalTo: voteCount.bottomAnchor, constant: 20),
                     overview.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
                     overview.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
                     
                     bannerimage.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: 20),
                     bannerimage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
                     bannerimage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
                     bannerimage.heightAnchor.constraint(equalToConstant: 250),
                     
                     spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                     spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                 ])
             }
         
         //bannerimage.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: -10).isActive = true
         //bannerimage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
         //bannerimage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
         //bannerimage.heightAnchor.constraint(equalToConstant: 250).isActive = true

     
     func bindSetup() {
          viewModel = MovieDetailsViewModel(model: MovieDetailsModel())
          viewModel?.updateMovieDetails = updateScreen
          viewModel?.fetchMovie(movieId: movieId)
     }
     
     func updateScreen() {
          DispatchQueue.main.async { [weak self] in
               self?.mainTitle.text = "Título: \(self?.viewModel?.movie?.title ?? "")"
               self?.voteAverage.text = "Pontuação Média: \(String(self?.viewModel?.movie?.voteAverage ?? 0.0))"
               self?.voteCount.text = "Total de votos: \(String(self?.viewModel?.movie?.voteCount ?? 0))"
               self?.overview.text = "Sobre:  \(self?.viewModel?.movie?.overview ?? "")"
               let url = "https://image.tmdb.org/t/p/w500" + (self?.viewModel?.movie?.backdropPath ?? "")
               self?.bannerimage.loadImage(from: url)
               self?.bannerimage.loadImage(from:"https://image.tmdb.org/t/p/w500\(self?.viewModel?.movie?.backdropPath ?? "")")
              self?.data_release.text = "Data: \(self?.viewModel?.movie?.releaseDate ?? "")"
             
          }
         hideLoading()
     }
     
     func showLoading() {
          view.addSubview(spinner)
          
          spinner.heightAnchor.constraint(equalToConstant: 200).isActive = true
          spinner.widthAnchor.constraint(equalToConstant: 200).isActive = true
          spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
     }
     
     func hideLoading() {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
               self.spinner.removeFromSuperview()
          }
     }
}

