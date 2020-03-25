//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation
import UIKit

struct MovieViewModel {
    
    private let baseURL = AppConstans.baseURLImage
    
    private let movie: Movie
    
    var displayTitle: String {
        return movie.originalTitle.capitalized
    }
       
    var displayOverview: String {
        return movie.overview.capitalized
    }
       
    var displayImage: UIImage {
        let url = URL(string: "\(baseURL)\(movie.posterPath)")!
        let imageData = try? Data(contentsOf: url)
        
        return UIImage(data: imageData!)!
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
