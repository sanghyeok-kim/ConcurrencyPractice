//
//  TargetType.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/02/22.
//

import Foundation

protocol TargetType {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
