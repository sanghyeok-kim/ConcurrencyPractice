//
//  NetworkProvider.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/03/01.
//

import Foundation

final class NetworkProvider {
    
    static let shared = NetworkProvider()
    
    private init() {}
    
    private func buildRequest(from endpoint: TargetType) throws -> URLRequest {
        guard let url = endpoint.baseURL?.appendingPathComponent(endpoint.path) else {
            throw NetworkError.invalidURL
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw NetworkError.invalidURL
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        }
        
        guard let finalUrl = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = endpoint.method.value
        
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
    
    func fetchData(endpoint: TargetType, completion: @escaping (Result<Data, Error>) -> Void) {
        let request: URLRequest
        
        do {
            request = try buildRequest(from: endpoint)
        } catch {
            completion(.failure(NetworkError.invalidRequest))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.errorDetected(error: error)))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            guard 200...299 ~= response.statusCode else {
                completion(.failure(NetworkError.invalidStatusCode(code: response.statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.invalidResponseData))
                return
            }

            completion(.success(data))
        }.resume()
    }
}
