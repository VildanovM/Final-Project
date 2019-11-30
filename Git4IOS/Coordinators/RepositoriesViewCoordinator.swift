//
//  RepositoriesViewCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

class RepositoriesViewCoordinator: UIViewController, UITableViewDelegate {
    
    // MARK: - Public Variables

    public var repositoriesType: RepositoriesType = .swift {
        didSet {
            title = repositoriesType.rawValue
        }
    }

    // MARK: - Private Variables

    private let repositoriesViewController = ListViewController()

    private var repositories = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = repositoriesType.rawValue
        repositoriesViewController.tableView.delegate = self

        add(asChildViewController: repositoriesViewController)
    }
    

      // MARK: - UITableViewDelegate

      public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      }

}
