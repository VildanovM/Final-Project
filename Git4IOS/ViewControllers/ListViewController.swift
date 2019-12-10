//
//  ListViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class ListViewController: UITableViewController {
    
    // MARK: - Public variables
    public var jsonModel: Model? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.reuseID)
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return jsonModel?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let starCount = jsonModel?.items[indexPath.row].stargazers_count, let name = jsonModel?.items[indexPath.row].name {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.reuseID, for: indexPath) as! ListViewCell
            cell.titleName.text = name
            cell.starCount.text = "★" + String(starCount)
            return cell
        }
        return UITableViewCell()
    }
    
}
