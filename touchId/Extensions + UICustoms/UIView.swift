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
    
    func MakeRound(value: Double,v:CACornerMask) {
        //myView.clipsToBounds = true
        if #available(iOS 13.0, *) {
            self.layer.cornerRadius = self.frame.size.width * value
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            self.layer.maskedCorners = v
        } else {
            // Fallback on earlier versions
        }
    }
    
}

