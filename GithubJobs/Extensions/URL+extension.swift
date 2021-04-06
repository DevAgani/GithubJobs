//
//  URL+extension.swift
//  GithubJobs
//
//  Created by George Nyakundi on 06/04/2021.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jobs.github.com"
        components.path = "/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL Components: \(components)"
            )
        }
        return url
    }
}

extension Endpoint {
    static var positions: Self {
        Endpoint(path: "positions.json")
    }
}

