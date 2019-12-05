//
//  ListViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public protocol Listable {
    var titleText: String { get }
    var descriptionText: String { get }
}

class ListViewController: UITableViewController {
    
    let githubResourse = RepositoriesType.swift
    var jsonModel: Model? {
        didSet {
            tableView.reloadData()
        }
    }
    

//    public var list = [Listable]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }

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
        //datasource.getData _> //
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.reuseID, for: indexPath) as! ListViewCell
//            cell.titleName.text = jsonModel?.items[indexPath.row].name
//            return cell
        cell.titleName.text = jsonModel?.items[indexPath.row].name
        return cell
        
    }
}
