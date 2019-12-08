//
//  SingUpViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public protocol ThirdCoordinatorDelegate: class {
    func navigateToFirstPage()
}

class SingUpViewController: UIViewController, UITextFieldDelegate {
    
    public weak var delegate: ThirdCoordinatorDelegate?
    
    // MARK: - Private variables
    private let loginMessageLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let singUpButton = UIButton()
    private let mainStackView = UIStackView()
    private let emailAndPasswordStackView = UIStackView()
    private let privacyPolicyLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Registration"
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        setMainStackView()
        setEmailAndPassword()
        setEmailStackView()
        setButtons()
        setRegistrationMessageLabel()
        setConstraintsAndAddSubview()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginMessageLabel.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.loginMessageLabel.alpha = 1
        })
        navigationController?.isNavigationBarHidden = false
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        confirmPasswordTextField.placeholder = "confirm password"
        emailTextField.borderStyle = .bezel
        passwordTextField.borderStyle = .bezel
        confirmPasswordTextField.borderStyle = .bezel
        emailTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        confirmPasswordTextField.autocorrectionType = .no
        
    }
    
    private func setEmailStackView() {
        
        emailAndPasswordStackView.axis = .vertical
        emailAndPasswordStackView.spacing = 5
        emailAndPasswordStackView.distribution = .fillEqually
        
        emailAndPasswordStackView.addArrangedSubview(emailTextField)
        emailAndPasswordStackView.addArrangedSubview(passwordTextField)
        emailAndPasswordStackView.addArrangedSubview(confirmPasswordTextField)
        
    }
    
    private func setButtons() {
        
        singUpButton.setTitle("Sing Up", for: .normal)
        singUpButton.backgroundColor = .blue
        singUpButton.layer.cornerRadius = 10
        singUpButton.addTarget(self, action: #selector(singUpAction), for: .touchUpInside)
        
    }
    
    private func setRegistrationMessageLabel() {
        
        loginMessageLabel.text = "Account Registration"
        loginMessageLabel.numberOfLines = 0
        loginMessageLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        privacyPolicyLabel.text = "By signing up, you agree to the Privacy Policy"
        privacyPolicyLabel.numberOfLines = 0
        privacyPolicyLabel.textAlignment = .center
        privacyPolicyLabel.textColor = .gray
        
        
    }
    
    private func setConstraintsAndAddSubview() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        mainStackView.addArrangedSubview(loginMessageLabel)
        mainStackView.addArrangedSubview(emailAndPasswordStackView)
        mainStackView.addArrangedSubview(singUpButton)
        mainStackView.addArrangedSubview(privacyPolicyLabel)
        
    }
    
    private func createAlertInvalidLoginOrPassword(messageText: String) {
        
        let alertController = UIAlertController(title: "Error", message: messageText, preferredStyle: .alert)
        
        let allertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(allertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    private func createSuccessLoginAndPassword() {
        
        let alertController = UIAlertController(title: "Success", message: "You created an account", preferredStyle: .alert)
        
        let allertAction = UIAlertAction(title: "Ok", style: .cancel) { [weak self]
            (allert) in
            guard let self = self else { return }
            self.delegate?.navigateToFirstPage()
        }
        alertController.addAction(allertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @objc private func singUpAction() {
        
        if let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text, let email = emailTextField.text {
            
            if !password.isEmpty && !confirmPassword.isEmpty && !email.isEmpty {
                
                if password == confirmPassword {
                    singUpButton.pulsate()
                    UIView.animate(withDuration: 0.3) {
                        self.singUpButton.backgroundColor = .gray
                        self.singUpButton.backgroundColor = .blue
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.createSuccessLoginAndPassword()
                    }
                    
                } else {
                    createAlertInvalidLoginOrPassword(messageText: "Invalid password")
                }
                
            } else {
                createAlertInvalidLoginOrPassword(messageText: "Invalid email or password")
            }
        }
        
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
