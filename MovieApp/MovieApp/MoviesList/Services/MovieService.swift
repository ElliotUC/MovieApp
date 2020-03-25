//
//  MovieService.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieServiceProtocol {
    func fetchMovies() -> Observable<Result>
}

class MovieService: MovieServiceProtocol {
    
    private let baseURL = URL(string: AppConstans.baseURL)!
    
    func fetchMovies() -> Observable<Result> {
        return Observable.create {[unowned self] observer in
            let apiRequest = MovieRequest()
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model = try JSONDecoder().decode(Result.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
