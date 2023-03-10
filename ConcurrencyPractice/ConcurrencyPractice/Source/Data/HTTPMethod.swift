//
//  HTTPMethod.swift
//  ConcurrencyPractice
//
//  Created by κΉμν on 2023/02/22.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    
    var value: String {
        return rawValue.uppercased()
    }
}
