//
//  RootRepositoriesCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

class RootRepositoriesCoordinator: UIViewController, UINavigationControllerDelegate {
    
    
    // MARK: - Private variables
    private let segmentedViewController = SegmentedViewController()
    private let swiftRepositoriesViewCoordinator = RepositoriesViewCoordinator()
    private let objectiveCRepositoriesViewCoordinator = RepositoriesViewCoordinator()
    private let tabbarController = UITabBarController()

    
    private lazy var navController = UINavigationController(rootViewController: segmentedViewController)

    override func viewDidLoad() {
        super.viewDidLoad()
        navController.delegate = self
        tabbarController.viewControllers = [navController, UIViewController()]
        swiftRepositoriesViewCoordinator.repositoriesType = .swift
        objectiveCRepositoriesViewCoordinator.repositoriesType = .objectiveC

        add(asChildViewController: tabbarController)
        segmentedViewController.items = [swiftRepositoriesViewCoordinator, objectiveCRepositoriesViewCoordinator]

    }
    

    // MARK: - UINavigationControllerDelegate

    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // Allows hiding the navigation bar for the rootViewController
        let hide = viewController == navigationController.viewControllers.first
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }

}
