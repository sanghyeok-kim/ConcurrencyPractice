//
//  UIImageView+Extension.swift
//  ConcurrencyPractice
//
//  Created by κΉμν on 2023/03/01.
//

import UIKit

extension UIImageView {
    func setImage(with data: Data) {
        DispatchQueue.main.async { [weak self] in
            self?.image = UIImage(data: data)
        }
    }
    
    func setPlaceholderView() {
        let placeholderImage = UIImage(systemName: "photo")
        image = placeholderImage
    }
}
