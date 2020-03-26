//
//  MoviesListViewModelTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/26/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest
import RxBlocking

@testable import MovieApp

class MoviesListViewModelTest: XCTestCase {
    
    var moviewsListViewModel: MoviesListViewModel!
    
    let result = Result(results: [Movie(posterPath: "/f2pj3SSj1GdFSrS5bUojT56umL6.jpg",
                                           backdropPath: "/gdkjHuMPwsdE3mw5dchAeRI1Wl2.jpg",
                                           originalTitle: "Howard the Duck",
                                           title: "Howard the Duck",
                                           overview: "A scientific experiment",
                                           releaseDate: "1989-10-05")])

    override func setUp() {
        super.setUp()
        moviewsListViewModel = MoviesListViewModel(movieService: MovieServiceMock(result))
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testShouldReturnFetchMoviesViewModel() throws {
        let result = try moviewsListViewModel.fetchMovies().toBlocking().first()!
        XCTAssertNotNil(result)
        XCTAssertEqual("Howard The Duck", (result.first?.displayTitle)!)
    }
}
