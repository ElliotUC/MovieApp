//
//  CoordinatorTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest

@testable import MovieApp

class CoordinatorTest: XCTestCase {
    
    var movie: Movie!
    var movieListViewModel: MoviesListViewModel!
    var movieViewModel: MovieViewModel!
    var coordinator: Coordinator!
    var movieListViewController: MovieListViewController!
    var detailMovieViewController: DetailMovieViewController!

    override func setUp() {
        super.setUp()
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = Coordinator(window: window)
        
        movie = Movie(posterPath: "/f2pj3SSj1GdFSrS5bUojT56umL6.jpg",
                      backdropPath: "/gdkjHuMPwsdE3mw5dchAeRI1Wl2.jpg",
                      originalTitle: "Howard the Duck",
                      title: "Howard the Duck",
                      overview: "A scientific experiment",
                      releaseDate: "1989-10-05")
        
        movieListViewModel = MoviesListViewModel()
        movieViewModel = MovieViewModel(movie: movie!)
        
        movieListViewController = MovieListViewController.instantiate(coordinator: coordinator!, viewModel: movieListViewModel!)
        detailMovieViewController = DetailMovieViewController.instantiate(coordinator: coordinator!, viewModel: movieViewModel!)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testStartMovieListViewController() {
        coordinator?.start()
        XCTAssertTrue(movieListViewController?.classForCoder == MovieListViewController.self)
    }
    
    func testShowDetailMovieViewController() {
        coordinator?.createNavigationController(UIViewController())
        coordinator?.showMovieDetail(movieViewModel: movieViewModel!)
        XCTAssertTrue(detailMovieViewController?.classForCoder == DetailMovieViewController.self)
    }
}
