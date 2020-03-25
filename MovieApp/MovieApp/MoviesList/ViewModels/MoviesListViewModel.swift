//
//  MoviesListViewModel.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation
import RxSwift

final class MoviesListViewModel {
    let title = "Movies"
    
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    func fetchMovies() -> Observable<[MovieViewModel]> {
        movieService.fetchMovies().map { $0.results.map { MovieViewModel(movie: $0)} }
    }
}

