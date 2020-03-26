//
//  Movie.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let posterPath: String
    let backdropPath: String
    let originalTitle: String
    let title: String
    let overview: String
    let releaseDate: String
    
    private enum CodingKeys: String, CodingKey, Codable {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case title
        case overview
        case releaseDate = "release_date"
    }
}
