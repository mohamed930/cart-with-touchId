//
//  UIButton.swift
//  touchId
//
//  Created by Mohamed Ali on 21/04/2023.
//

import UIKit

extension UIButton {
    func SetRadioButtonSelectedInUI() {
        if self.isSelected {
            self.isSelected = false
        }
        else {
            self.isSelected = true
        }
    }
}
