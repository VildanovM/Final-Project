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
    
    // MARK: - Variables

    public var list = [Listable]() {
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
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //datasource.getData _> //
//        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.reuseID, for: indexPath)

        return UITableViewCell()
    }
}
