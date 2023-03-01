//
//  MainTableViewDataSource.swift
//  ConcurrencyPractice
//
//  Created by 김상혁 on 2023/03/01.
//

import UIKit

final class MainTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCell.identifier,
            for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        return cell
    }
}
