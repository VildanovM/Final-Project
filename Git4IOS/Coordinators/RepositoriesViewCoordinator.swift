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

    private var jsonModel: Model?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = repositoriesType.rawValue
        repositoriesViewController.tableView.delegate = self

        add(asChildViewController: repositoriesViewController)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkService.get(url: repositoriesType.githubRessourceURL) { [weak self] json in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let json = json else { return }
                self.jsonModel = json
                self.repositoriesViewController.jsonModel = json
                
            }
        }
        
    }
    

      // MARK: - UITableViewDelegate

      public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()

//        let detail = jsonModel?.items[indexPath.row]

        navigationController?.pushViewController(detailViewController, animated: true)
        
      }

}
