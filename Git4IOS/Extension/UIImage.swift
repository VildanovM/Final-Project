//
//  UIImage.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 08.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

extension UIImageView {
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = CFTimeInterval(HUGE)
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
