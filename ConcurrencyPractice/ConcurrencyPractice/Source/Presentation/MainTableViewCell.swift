//
//  MainTableViewCell.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/03/01.
//

import UIKit

final class MainTableViewCell: UITableViewCell, CellIdentifiable {
    
    private lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setPlaceholderView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loadProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        return progressView
    }()
    
    private lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle("load", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loadButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cellImageView, loadProgressView, loadButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layout()   
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        cellImageView.setPlaceholderView()
//    }
    
    private func layout() {
        contentView.addSubview(containerStackView)
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        containerStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    @objc private func loadButtonDidTap() {
        cellImageView.setPlaceholderView()
        fetchImage()
    }
    
    private func fetchImage() {
        NetworkProvider.shared.fetchData(endpoint: Endpoint.fetch300x200picture) { [weak self] (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                self?.cellImageView.setImage(with: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
