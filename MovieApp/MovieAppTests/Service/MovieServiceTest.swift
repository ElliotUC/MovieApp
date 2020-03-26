//
//  MovieServiceTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/26/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import MovieApp

class MovieServiceTest: XCTestCase {
    
    var movieService: MovieService!

    override func setUp() {
        super.setUp()
        HTTPStubs.setEnabled(true)
        movieService = MovieService()
    }

    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }

    func testShouldReturnResultData() throws {
        stub(condition: isHost("themoviedb.org")) { _ in
            let stubsPath = OHPathForFile("JSON/DataResult.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let result = try movieService.fetchMovies().toBlocking().first()!
        XCTAssertNotNil(result)
    }
}
