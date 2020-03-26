//
//  APIRequestTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/26/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest
import Foundation

@testable import MovieApp

class APIRequestTest: XCTestCase {
    
    var apiRequest: APIRequest!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShouldReturnURLRequestForMovieRequest() {
        apiRequest = MovieRequest()
        let url = apiRequest.request(with: URL(string:AppConstans.baseURL)!)
        XCTAssertNotNil(url)
        XCTAssertEqual((url.url?.absoluteString)!, "https://api.themoviedb.org/4/list/1?page=1&api_key=\(ProcessInfo.processInfo.environment["api_key"]!)")
    }
}
