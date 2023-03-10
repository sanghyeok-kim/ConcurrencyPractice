//
//  CellIdentifiable.swift
//  ConcurrencyPractice
//
//  Created by κΉμν on 2023/03/01.
//

import Foundation

protocol CellIdentifiable { }

extension CellIdentifiable {
    static var identifier: String {
        return String(describing: "\(self)")
    }
}
