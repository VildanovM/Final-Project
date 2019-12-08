////
////  FirstCoordinator.swift
////  Git4IOS
////
////  Created by Максим Вильданов on 07.12.2019.
////  Copyright © 2019 Максим Вильданов. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class SingInCoordinator: Coordinator {
//    
//    var childCoordinators: [Coordinator] = []
//    
//    unowned let navigationController:UINavigationController
//    
//    required init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    func start() {
//        let singInController = SingInViewController()
//        singInController.delegate = self
//        self.navigationController.viewControllers = [singInController]
//    }
//}
//
//extension SingInViewController: SingInViewControllerDelegate {
//
//    // Navigate to next page
//    func navigateToNextPage() {
//       let secondCoordinator = SecondCoordinator(navigationController: navigationController)
//       secondCoordinator.delegate = self
//       childCoordinators.append(secondCoordinator)
//       secondCoordinator.start()
//    }
//}
//
//extension FirstCoordinator: BackToFirstViewControllerDelegate {
//    
//    // Back from third page
//    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator) {
//        navigationController.popToRootViewController(animated: true)
//        childCoordinators.removeLast()
//    }
