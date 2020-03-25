//
//  ViewController.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
      private let disposeBag = DisposeBag()
      private var viewModel: MoviesListViewModel!
      private var coordinator: Coordinator!
      
      @IBOutlet weak var tableView: UITableView!
      
      static func instantiate(coordinator: Coordinator, viewModel: MoviesListViewModel) -> ViewController {
          let storyboard = UIStoryboard(name: "Main", bundle: .main)
          let viewController = storyboard.instantiateInitialViewController() as! ViewController
          viewController.coordinator = coordinator
          viewController.viewModel = viewModel
          return viewController
      }

      override func viewDidLoad() {
          super.viewDidLoad()
          
          navigationController?.navigationBar.prefersLargeTitles = true
          navigationItem.title = viewModel.title
   
          viewModel.fetchMovies().observeOn(MainScheduler.instance)
              .bind(to: tableView.rx.items(cellIdentifier: "cell")) {index, viewModel, cell in
                  cell.textLabel?.text = viewModel.displayTitle
          }.disposed(by: disposeBag)  
      }
}

