//
//  MainCoordinator.swift
//  final_project
//
//  Created by Jackson on 23/05/23.
//

import UIKit

class MainCoordinator: Coordinator {
     var navigationController: UINavigationController?
     //    var childCoordinators = [Coordinator]()
     
     func start() {
          startWithViewCode()
     }
     
     func navigate(to route: Routes, data: Any?) {
          switch route {
               
          case .moviesDetails:
               guard let movieId = data as? String else { return }
               let vc = MovieDetailsController(movieId: movieId)
               vc.coordinator = self
               navigationController?.pushViewController(vc, animated: true)
               
          case .moviesList:
               let vc = MoviesListController()
               vc.coordinator = self
               navigationController?.pushViewController(vc, animated: true)
               
          }
     }
     
     private func startWithStoryboard() {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: "moviesList") as? MoviesListController
          
          guard let vc = vc else { return }
          
          vc.coordinator = self
          navigationController?.setViewControllers([vc], animated: false)
     }
     
     private func startWithViewCode() {
          let vc = MoviesListController()
          vc.coordinator = self
          navigationController?.setViewControllers([vc], animated: false)
     }
}
