//
//  MovieService.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import RxSwift

protocol MovieServiceProtocol {
    func fetchMovies() -> Observable<Result>
}

class MovieService: MovieServiceProtocol {

    func fetchMovies() -> Observable<Result> {
        APIClient().send(apiRequest: MovieRequest())
    }
}
