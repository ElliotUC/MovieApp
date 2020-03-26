//
//  DetailMovieViewControllerTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/26/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest

@testable import MovieApp

class DetailMovieViewControllerTest: XCTestCase {
     
    var coordinator: Coordinator!
    var movieViewModel: MovieViewModel!
    var detailMovieViewController: DetailMovieViewController!
    
    let movie = Movie(posterPath: "/f2pj3SSj1GdFSrS5bUojT56umL6.jpg",
                      backdropPath: "/gdkjHuMPwsdE3mw5dchAeRI1Wl2.jpg",
                      originalTitle: "Howard the Duck",
                      title: "Howard the Duck",
                      overview: "A scientific experiment",
                      releaseDate: "1989-10-05")

    override func setUp() {
        super.setUp()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = Coordinator(window: window)
        movieViewModel = MovieViewModel(movie: movie)
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testShouldInstantiateSuccessful() {
        detailMovieViewController = DetailMovieViewController.instantiate(coordinator: coordinator, viewModel: movieViewModel)
        XCTAssertNotNil(detailMovieViewController)
    }
    
    func testShouldShowDataInIBOutlet() {
        detailMovieViewController = DetailMovieViewController.instantiate(coordinator: coordinator, viewModel: movieViewModel)

        _ = detailMovieViewController.view
        
        XCTAssertEqual(detailMovieViewController.movieImage.image!.pngData(), movieViewModel.displayImage.pngData())
        XCTAssertEqual(detailMovieViewController.titleMovie.text, movieViewModel.displayTitle)
        XCTAssertEqual(detailMovieViewController.overviewMovie.text, movieViewModel.displayOverview)
    }
}
