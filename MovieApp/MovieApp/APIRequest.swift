//
//  APIRequest.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import Foundation

public enum Type: String {
    case GET, POST, PUT, DELETE
}

protocol APIRequest {
    var method: Type { get }
    var path: String { get }
    var parameters: [String : String] { get }
    var headers: [String: String] { get }
}

extension APIRequest {
    
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                             resolvingAgainstBaseURL: false) else {
                                                fatalError("error to create component")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let url = components.url else {
            fatalError("url error")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        _ = headers.map {
            request.addValue($1, forHTTPHeaderField: $0)
        }
        
        return request
    }
    
}
