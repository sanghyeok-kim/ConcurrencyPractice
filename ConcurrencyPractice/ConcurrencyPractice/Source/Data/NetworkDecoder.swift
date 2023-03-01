//
//  NetworkDecoder.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/03/01.
//

import Foundation

protocol NetworkDecoder {
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

final class DefaultNetworkDecoder: NetworkDecoder {
    // 동기
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
    
    // 비동기 - GCD
    static func decode<T: Decodable>(_ type: T.Type, from data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        //네트워크 처리는 사용자 인터페이스와 관련된 작업이므로 빠른 응답을 위해 userInitiated 사용
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(type, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // 비동기 - async/await
    
}
