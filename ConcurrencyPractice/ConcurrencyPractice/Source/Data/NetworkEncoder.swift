//
//  NetworkEncoder.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/03/01.
//

import Foundation

protocol NetworkEncoder {
    static func encode<T: Encodable>(_ value: T) throws -> Data
}

final class DefaultNetworkEncoder: NetworkEncoder {
    //동기
    static func encode<T: Encodable>(_ value: T) throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(value)
    }
    
    //비동기 - GCD
    static func encode<T: Encodable>(_ value: T, completion: @escaping (Result<Data, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(value)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    //비동기 - async/await
}
