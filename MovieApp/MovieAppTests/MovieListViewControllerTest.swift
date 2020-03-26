//
//  MovieListViewControllerTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest

@testable import MovieApp

class MovieListViewControllerTest: XCTestCase {
    
    var movieListViewModel: MoviesListViewModel!
    var coordinator: Coordinator!
    var movieListViewController: MovieListViewController!
    
    let result = Result(results: [Movie(posterPath: "/f2pj3SSj1GdFSrS5bUojT56umL6.jpg",
                                        backdropPath: "/gdkjHuMPwsdE3mw5dchAeRI1Wl2.jpg",
                                        originalTitle: "Howard the Duck",
                                        title: "Howard the Duck",
                                        overview: "A scientific experiment",
                                        releaseDate: "1989-10-05")])
    
    override func setUp() {
        super.setUp()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = Coordinator(window: window)
        movieListViewModel = MoviesListViewModel()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShouldInstantiateSuccessful() {
        movieListViewModel = MoviesListViewModel(movieService: MovieServiceMock(result))
        movieListViewController = MovieListViewController.instantiate(coordinator: coordinator, viewModel: movieListViewModel)
        
        XCTAssertNotNil(movieListViewController)
    }
    

    func testShouldShowMovieList() {
        movieListViewModel = MoviesListViewModel(movieService: MovieServiceMock(result))
        movieListViewController = MovieListViewController.instantiate(coordinator: coordinator, viewModel: movieListViewModel)
        
        _ = movieListViewController.view
        
        XCTAssert(movieListViewController.tableView.visibleCells.count == result.results.count)
    }
    
    func testShouldShowDetailWhenTableViewItemIsClicked() {
        let expectation = XCTestExpectation(description: "should push")
        movieListViewModel = MoviesListViewModel(movieService: MovieServiceMock(result))
        movieListViewController = MovieListViewController.instantiate(coordinator: coordinator, viewModel: movieListViewModel)
        
        _ = movieListViewController.view

        coordinator.createNavigationController(UIViewController())
        
        movieListViewController.tableView.delegate!.tableView?(movieListViewController.tableView,
                                                               didSelectRowAt: IndexPath(item: 0, section: 0))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            XCTAssertTrue(self.coordinator.navigationController.visibleViewController is DetailMovieViewController)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }

}
