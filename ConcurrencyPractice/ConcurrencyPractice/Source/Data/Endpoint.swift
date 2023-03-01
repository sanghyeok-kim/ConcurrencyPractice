//
//  Endpoint.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/02/22.
//

import Foundation

enum Endpoint {
    case fetch300x200picture
}

extension Endpoint: TargetType {
    var baseURL: URL? {
        switch self {
        case .fetch300x200picture:
            return URL(string: "https://picsum.photos")
        }
    }

    var path: String {
        switch self {
        case .fetch300x200picture:
            return "/300/200"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetch300x200picture:
            return .get
        }
    }

    var headers: [String: String]? {
        switch self {
        case .fetch300x200picture:
            return nil
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .fetch300x200picture:
            return nil
        }
    }
}
