//
//  ThirdCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 08.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit


protocol BackToSingInControllerDelegate: class {
    
    func navigateBackToFirstPage(newOrderCoordinator: ThirdCoordinator)
    
}

class ThirdCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: BackToSingInControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let thirdViewController : SingUpViewController = SingUpViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
}

extension ThirdCoordinator : ThirdCoordinatorDelegate {
    
    
    // Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}

