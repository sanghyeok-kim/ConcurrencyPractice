//
//  HTTPMethod.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/02/22.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    
    var value: String {
        return rawValue.uppercased()
    }
}
