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
    private let containerView = UIView()
    private let stackView = UIStackView()
    private let topStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        topStackView.axis = .vertical
        topStackView.alignment = .center
        topStackView.distribution = .equalSpacing
        topStackView.isLayoutMarginsRelativeArrangement = true
        topStackView.preservesSuperviewLayoutMargins = true
        


        view.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        logoutButton.backgroundColor = .gray
        logoutButton.setTitle("Logout", for: .normal)
        
        view.addSubview(stackView)
        view.anchor(view: stackView, useSafeAnchors: false)
        
        stackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(logoutButton)
        stackView.addArrangedSubview(containerView)
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
