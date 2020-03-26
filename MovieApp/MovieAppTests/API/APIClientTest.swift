//
//  APIClientTest.swift
//  MovieAppTests
//
//  Created by Elliot on 3/26/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import MovieApp

class APIClientTest: XCTestCase {
    
    var apiClient: APIClient!

    override func setUp() {
        super.setUp()
        apiClient = APIClient()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldReturnDataJson() throws {
        stub(condition: isHost("themoviedb.org")) { _ in
            let stubsPath = OHPathForFile("JSON/DataResult.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let result: Result = try apiClient.send(apiRequest: MovieRequest()).toBlocking().first()!
        XCTAssertNotNil(result)
    }
}
