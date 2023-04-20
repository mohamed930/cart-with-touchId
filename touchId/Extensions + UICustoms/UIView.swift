//
//  UIView.swift
//  touchId
//
//  Created by Mohamed Ali on 20/04/2023.
//
 
import UIKit

extension UIView {
    
    func MakeCornerRadious(value: Double) {
        self.layer.cornerRadius  = self.frame.size.width * value
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0
        self.layer.borderColor = .none
    }
}
