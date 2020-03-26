//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListViewController: UIViewController {
    
      private let disposeBag = DisposeBag()
      private var viewModel: MoviesListViewModel!
      private var coordinator: Coordinator!
      
      @IBOutlet weak var tableView: UITableView!
      
      static func instantiate(coordinator: Coordinator, viewModel: MoviesListViewModel) -> MovieListViewController {
          let storyboard = UIStoryboard(name: "Main", bundle: .main)
          let viewController = storyboard.instantiateInitialViewController() as! MovieListViewController
          viewController.coordinator = coordinator
          viewController.viewModel = viewModel
          return viewController
      }

      override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel.title
   
        viewModel.fetchMovies().observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) {index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayTitle
        }.disposed(by: disposeBag)
          
        tableView.rx.modelSelected(MovieViewModel.self).subscribe(onNext: { (movieViewModel) in
            self.coordinator.showMovieDetail(movieViewModel: movieViewModel)
        }).disposed(by: disposeBag)
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

