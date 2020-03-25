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
    private var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(coordinator: self, viewModel: MoviesListViewModel())
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showMovieDetail(movieViewModel: MovieViewModel) {
        let viewController = DetailMovieViewController.instantiate(coordinator: self, viewModel: movieViewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
