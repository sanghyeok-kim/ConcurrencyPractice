//
//  TargetType.swift
//  ConcurrencyPractice
//
//  Created by κΉμν on 2023/02/22.
//

import Foundation

protocol TargetType {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
