//
//  MovieViewModelTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/26/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest

@testable import MovieApp

class MovieViewModelTest: XCTestCase {
    
    var movieViewModel: MovieViewModel?
  
    let movie = Movie(posterPath: "/f2pj3SSj1GdFSrS5bUojT56umL6.jpg",
                      backdropPath: "/gdkjHuMPwsdE3mw5dchAeRI1Wl2.jpg",
                      originalTitle: "Howard The Duck",
                      title: "Howard The Duck",
                      overview: "A scientific experiment",
                      releaseDate: "1989-10-05")
    
    let emptyMovie = Movie(posterPath: "",
                           backdropPath: "",
                           originalTitle: "",
                           title: "",
                           overview: "",
                           releaseDate: "")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShouldValidateDataMovieViewModel() {
        movieViewModel = MovieViewModel(movie: movie)
        XCTAssertEqual("Howard The Duck", (movieViewModel?.displayTitle)!)
        XCTAssertEqual("A scientific experiment", (movieViewModel?.displayOverview)!)
        XCTAssertNotNil(movieViewModel?.displayImage)
    }
    
    func testShouldValidateMovieViewModelWhenMovieIsEmpty() {
        movieViewModel = MovieViewModel(movie: emptyMovie)
        XCTAssertEqual("", (movieViewModel?.displayTitle))
        XCTAssertEqual("", (movieViewModel?.displayOverview)!)
        XCTAssertEqual(UIImage(), movieViewModel?.displayImage)
    }
}
