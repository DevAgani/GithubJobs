//
//  GithubAPIService.swift
//  GithubJobs
//
//  Created by George Nyakundi on 23/03/2021.
//

import Foundation

class GithubAPIService {
    static let shared = GithubAPIService()
    private let jsonDecoder = JSONDecoder()
    
    private enum HTTPMethod: String {
        case get = "GET"
    }
    
    public enum APIServiceError: Error {
        case invalidRequest(String)
        case invalidURL(String)
        case forwared(Error)
        case invalidPayload(URL)
    }
    
    func fetchAllJobs(using session: URLSession = .init(configuration: .default, delegate: nil, delegateQueue: .main), completionHandler: @escaping(Result<[GithubJob],APIServiceError>) -> Void) {
        
        session.request(.positions) { data, response, error in
            
            guard error == nil else {
                completionHandler(.failure(.forwared(error!)))
                return
            }
            guard let jsonData = data else {
                return
            }
            
            do {
                let jobs = try self.jsonDecoder.decode([GithubJob].self, from: jsonData)
                completionHandler(.success(jobs))
            } catch {
                completionHandler(.failure(.forwared(error)))
            }
        }
        
    }
}
