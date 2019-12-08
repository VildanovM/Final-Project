//
//  RootRepositoriesCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public protocol SecondViewControllerDelegate: class {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class RootRepositoriesCoordinator: UIViewController, UINavigationControllerDelegate, UITabBarControllerDelegate {
    
    public weak var delegate: SecondViewControllerDelegate?
    // MARK: - Private variables
    private let segmentedViewController = SegmentedViewController()
    private let swiftRepositoriesViewCoordinator = RepositoriesViewCoordinator()
    private let objectiveCRepositoriesViewCoordinator = RepositoriesViewCoordinator()
    private lazy var tabbarController = UITabBarController()
    private lazy var navController = UINavigationController(rootViewController: segmentedViewController)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navController.delegate = self
        swiftRepositoriesViewCoordinator.repositoriesType = .swift
        objectiveCRepositoriesViewCoordinator.repositoriesType = .objectiveC
        tabbarController.delegate = self
        let gitHubViewController = GithubViewController()
        let logoutViewController = LogoutViewController()
        
        let imageRepository = UIImage(named: "1")
        let imageGithub = UIImage(named: "2")
        let imageQuit = UIImage(named: "3")
        
        let listTabBarItem = UITabBarItem(title: "Repositories", image: imageRepository, tag: 0)
        let githubTabBarItem = UITabBarItem(title: "Go To Github", image: imageGithub, tag: 1)
        let quitTabBarItem = UITabBarItem(title: "Quit", image: imageQuit, tag: 2)

        segmentedViewController.tabBarItem = listTabBarItem
        gitHubViewController.tabBarItem = githubTabBarItem
        logoutViewController.tabBarItem = quitTabBarItem
        
        tabbarController.viewControllers = [navController, gitHubViewController, logoutViewController]
        
        add(asChildViewController: tabbarController)
        segmentedViewController.items = [swiftRepositoriesViewCoordinator, objectiveCRepositoriesViewCoordinator]
    
    }
    
    public func goToRepository(url:String) {
        UIApplication.shared.open(URL(string: url)! as URL, options: [:], completionHandler: nil)
    }
    
    
    // MARK: - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // Allows hiding the navigation bar for the rootViewController
        let hide = viewController == navigationController.viewControllers.first
        navigationController.setNavigationBarHidden(hide, animated: animated)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        if selectedIndex == 2 {
            self.delegate?.navigateToThirdPage()
            return false
        }
        return true
    }
    
}
