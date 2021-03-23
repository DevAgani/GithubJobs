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
    
    func fetchAllJobs(completionHandler: @escaping(Result<[GithubJob],APIServiceError>) -> Void) {
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let endpoint = "https://jobs.github.com/positions.json"
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.invalidURL(endpoint)))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        
        session.dataTask(with: urlRequest) {[weak self] (data, response, error) in
            guard let `self` = self else {
                return
            }
            guard error == nil else {
                completionHandler(.failure(.forwared(error!)))
                return
            }
            guard let jsonData = data else {
                completionHandler(.failure(.invalidPayload(url)))
                return
            }
            
            do {
                let jobs = try self.jsonDecoder.decode([GithubJob].self, from: jsonData)
                completionHandler(.success(jobs))
            } catch {
                completionHandler(.failure(.forwared(error)))
            }
            
        }.resume()
    }
}
