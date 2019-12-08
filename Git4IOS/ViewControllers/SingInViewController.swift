//
//  SingInViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public protocol FirstViewControllerDelegate: class {
    func navigateToNextPage()
    func navigateToSingUpPage()
}

class SingInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Private variables
    private let loginMessageLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let singInButton = UIButton()
    private let mainStackView = UIStackView()
    private let emailAndPasswordStackView = UIStackView()
    private let singUpButton = UIButton()
    private let rootNavigation = RootRepositoriesCoordinator()
    
    public weak var delegate: FirstViewControllerDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setMainStackView()
        setEmailAndPassword()
        setEmailStackView()
        setButtons()
        setLoginMessageLabel()
        setConstraintsAndAddSubview()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginMessageLabel.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.loginMessageLabel.alpha = 1
        })
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Private function
    private func setMainStackView() {
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.preservesSuperviewLayoutMargins = true
        view.addSubview(mainStackView)
        
    }
    
    private func setEmailAndPassword() {
        
        emailTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
        emailTextField.borderStyle = .bezel
        passwordTextField.borderStyle = .bezel
        
        emailTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        
    }
    
    private func setEmailStackView() {
        
        emailAndPasswordStackView.axis = .vertical
        emailAndPasswordStackView.spacing = 5
        emailAndPasswordStackView.distribution = .fillEqually
        
        emailAndPasswordStackView.addArrangedSubview(emailTextField)
        emailAndPasswordStackView.addArrangedSubview(passwordTextField)
        
    }
    
    private func setButtons() {
        
        singInButton.setTitle("Sing In", for: .normal)
        singInButton.backgroundColor = .blue
        singInButton.layer.cornerRadius = 10
        singInButton.addTarget(self, action: #selector(singInAction), for: .touchUpInside)
        
        singUpButton.setTitle("Sing Up", for: .normal)
        singUpButton.setTitleColor(.blue, for: .normal)
        singUpButton.addTarget(self, action: #selector(singUpAction), for: .touchUpInside)
        
    }
    
    private func setLoginMessageLabel() {
        
        loginMessageLabel.text = "Login with Email Address"
        loginMessageLabel.numberOfLines = 0
        loginMessageLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
    }
    
    private func setConstraintsAndAddSubview() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        mainStackView.addArrangedSubview(loginMessageLabel)
        mainStackView.addArrangedSubview(emailAndPasswordStackView)
        mainStackView.addArrangedSubview(singInButton)
        mainStackView.addArrangedSubview(singUpButton)
        
    }
    
    @objc private func singInAction() {
        singInButton.pulsate()
        UIView.animate(withDuration: 0.3) {
            self.singInButton.backgroundColor = .gray
            self.singInButton.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.delegate?.navigateToNextPage()
        }
    }
    
    @objc private func singUpAction() {
        self.delegate?.navigateToSingUpPage()
    }
    
    // MARK: - TextFieldDelegate 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
}
