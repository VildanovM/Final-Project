//
//  LogoutViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 30.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {
    
    private let logoutButton = UIButton()
    private var rootNavigation = RootRepositoriesCoordinator()
    public weak var delegate: SecondViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLogoutButton()
        setConstraintLogoutButton()
        
    }
    

    private func setLogoutButton() {
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .blue
        logoutButton.layer.cornerRadius = 10
        logoutButton.addTarget(self, action: #selector(pushToSingInViewController), for: .touchUpInside)
        view.addSubview(logoutButton)
    }
    
    private func setConstraintLogoutButton() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        logoutButton.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        
    }
    
    @objc private func pushToSingInViewController() {
        logoutButton.pulsate()
        UIView.animate(withDuration: 0.3) {
            self.logoutButton.backgroundColor = .gray
            self.logoutButton.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.delegate?.navigateToFirstPage()
        }
        
    }

}
