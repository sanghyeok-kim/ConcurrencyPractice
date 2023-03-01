//
//  NetworkError.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/02/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidStatusCode(code: Int)
    case invalidResponseData
    case invalidRequest
    case decodeError
    case errorDetected(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invaild response."
        case .invalidStatusCode(let code):
            return "Invalid status code: \(code)"
        case .invalidResponseData:
            return "Invalid response data."
        case .invalidRequest:
            return "Invalid request."
        case .decodeError:
            return "Fail to decode."
        case .errorDetected(let error):
            return "Error detected: \(error.localizedDescription)"
        }
    }
}
