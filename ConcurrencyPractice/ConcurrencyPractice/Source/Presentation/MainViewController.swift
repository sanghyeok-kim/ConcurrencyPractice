//
//  MainViewController.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/02/22.
//

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainTableViewDelegate = MainTableViewDelegate()
    private lazy var mainTableViewDataSource = MainTableViewDataSource()
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = mainTableViewDelegate
        tableView.dataSource = mainTableViewDataSource
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.rowHeight = 150
        return tableView
    }()
    
    private lazy var loadAllImagesView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.addSubview(loadAllImagesButton)
        loadAllImagesButton.translatesAutoresizingMaskIntoConstraints = false
        loadAllImagesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadAllImagesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadAllImagesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        loadAllImagesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var loadAllImagesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load All Images", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(loadAllImagesButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    @objc private func loadAllImagesButtonDidTap() {
        
    }
    
    private func layout() {
        view.addSubview(mainTableView)
        view.addSubview(loadAllImagesView)
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: loadAllImagesView.topAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        loadAllImagesView.translatesAutoresizingMaskIntoConstraints = false
        loadAllImagesView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadAllImagesView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loadAllImagesView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadAllImagesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
    }
}
