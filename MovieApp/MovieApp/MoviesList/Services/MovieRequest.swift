//
//  MovieRequest.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation

class MovieRequest: APIRequest {
    var method: Type = Type.GET
    var path: String = "4/list/1"
    var parameters: [String : String] = ["page": "1", "api_key":
                                        ProcessInfo.processInfo.environment["api_key"]!]
    var headers: [String : String] = [:]
}
