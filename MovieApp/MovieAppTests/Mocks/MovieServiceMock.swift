//
//  MovieServiceMock.swift
//  MovieAppTests
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation
import RxSwift

@testable import MovieApp

class MovieServiceMock: MovieServiceProtocol {
    
    private var result: Result
    
    required init(_ result: Result) {
        self.result = result
    }
    
    func fetchMovies() -> Observable<Result> {
        return Observable.just(self.result)
    }
}
