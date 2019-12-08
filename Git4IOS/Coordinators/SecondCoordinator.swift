//
//  SecondCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit


protocol BackToFirstViewControllerDelegate: class {
    
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator)
    
}

class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: BackToFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController : RootRepositoriesCoordinator = RootRepositoriesCoordinator()
        secondViewController.delegate = self
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension SecondCoordinator : SecondViewControllerDelegate {
    
    // Navigate to third page
    func navigateToThirdPage() {
        let thirdViewController : LogoutViewController = LogoutViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    // Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}


