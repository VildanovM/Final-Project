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
    private let logoutLabel = UILabel()
    private let logoutStackView = UIStackView()
    public weak var delegate: SecondViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Logout"
        setLogoutLabel()
        setLogoutButton()
        setLogoutStackView()
        setLogoutStackViewConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logoutLabel.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.logoutLabel.alpha = 1
        })
        navigationController?.isNavigationBarHidden = false
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setLogoutLabel() {
        logoutLabel.text = "Already leaving? We will miss you! 😢"
        logoutLabel.numberOfLines = 0
        logoutLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
    

    private func setLogoutButton() {
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .blue
        logoutButton.layer.cornerRadius = 10
        logoutButton.addTarget(self, action: #selector(pushToSingInViewController), for: .touchUpInside)
    }
    
    private func setLogoutStackView() {
        logoutStackView.axis = .vertical
        logoutStackView.distribution = .equalSpacing
        logoutStackView.isLayoutMarginsRelativeArrangement = true
        logoutStackView.preservesSuperviewLayoutMargins = true
        view.addSubview(logoutStackView)
    }
    
    private func setLogoutStackViewConstraint() {
        logoutStackView.translatesAutoresizingMaskIntoConstraints = false
        logoutStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        logoutStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        logoutStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        logoutStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        logoutStackView.addArrangedSubview(logoutLabel)
        logoutStackView.addArrangedSubview(logoutButton)
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
