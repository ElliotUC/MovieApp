//
//  Coordinator.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import UIKit

class Coordinator {
    
    private let window: UIWindow
    var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = MovieListViewController.instantiate(coordinator: self, viewModel: MoviesListViewModel())
        createNavigationController(viewController)        
    }
    
    func showMovieDetail(movieViewModel: MovieViewModel) {
        let viewController = DetailMovieViewController.instantiate(coordinator: self, viewModel: movieViewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func createNavigationController(_ controller: UIViewController)  {
        navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
