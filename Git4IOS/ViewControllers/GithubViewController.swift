//
//  GithubViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 08.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

class GithubViewController: UIViewController {
    
    private let mainStackView = UIStackView()
    private let githubCatImage = UIImageView()
    private let goToGithubButton = UIButton()
    private let navigationRoot = RootRepositoriesCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setGithubCatImage()
        setGithubButton()
        setMainStackView()
        setLogoutStackViewConstraint()
        setLogoutStackViewConstraint()
    }
    

    private func setGithubCatImage() {
        githubCatImage.image = UIImage(named: "0ba2aa20e2c2ce80e9a2db5b07198464")
        githubCatImage.contentMode = .scaleAspectFill
       
    }
    

    private func setGithubButton() {
        goToGithubButton.setTitle("Go to Github", for: .normal)
        goToGithubButton.backgroundColor = .blue
        goToGithubButton.layer.cornerRadius = 10
        goToGithubButton.addTarget(self, action: #selector(pushToSingInViewController), for: .touchUpInside)
    }
    
    private func setMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 100
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.preservesSuperviewLayoutMargins = true
        view.addSubview(mainStackView)
    }
    
    private func setLogoutStackViewConstraint() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        mainStackView.addArrangedSubview(githubCatImage)
        mainStackView.addArrangedSubview(goToGithubButton)
        
        goToGithubButton.translatesAutoresizingMaskIntoConstraints = false
        goToGithubButton.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, multiplier: 0.13).isActive = true
    }
    
    @objc private func pushToSingInViewController() {
        goToGithubButton.pulsate()
        UIView.animate(withDuration: 0.3) {
            self.goToGithubButton.backgroundColor = .gray
            self.goToGithubButton.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigationRoot.goToRepository(url: "https://github.com")
        }
        
    }


}
