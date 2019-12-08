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
    private lazy var navController = UINavigationController(rootViewController: tabbarController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navController.delegate = self
        swiftRepositoriesViewCoordinator.repositoriesType = .swift
        objectiveCRepositoriesViewCoordinator.repositoriesType = .objectiveC
        tabbarController.viewControllers = [segmentedViewController, LogoutViewController()]
        
        add(asChildViewController: navController)
        segmentedViewController.items = [swiftRepositoriesViewCoordinator, objectiveCRepositoriesViewCoordinator]
    
    }
    
    public func goToGithub(url:String) {
        UIApplication.shared.open(URL(string: url)! as URL, options: [:], completionHandler: nil)
    }
    
    public func presentToSingUpViewController() {
        let singUpViewController = SingUpViewController()
        present(singUpViewController, animated: true, completion: nil)
    }
    
    public func pushToSingInViewController() {
        let singInViewController = SingInViewController()
        navigationController?.pushViewController(singInViewController, animated: true)
    }
    
    public func pushToLogout() {
        let logoutViewController = LogoutViewController()
        navController.pushViewController(logoutViewController, animated: true)
    }
    
    // MARK: - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // Allows hiding the navigation bar for the rootViewController
        let hide = viewController == navigationController.viewControllers.first
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
    
}
