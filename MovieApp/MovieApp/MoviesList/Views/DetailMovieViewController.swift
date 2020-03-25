//
//  DetailMovieViewController.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    private var coordinator: Coordinator!
    private var viewModel: MovieViewModel!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    
    static func instantiate(coordinator: Coordinator, viewModel: MovieViewModel) -> DetailMovieViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailMovieViewController
        viewController.coordinator = coordinator
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImage.image = viewModel.displayImage
        titleMovie.text = viewModel.displayTitle
        overviewMovie.text = viewModel.displayOverview
    }
    
}
