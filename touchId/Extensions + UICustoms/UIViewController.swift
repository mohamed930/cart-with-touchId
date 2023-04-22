//
//  UIViewController.swift
//  touchId
//
//  Created by Mohamed Ali on 22/04/2023.
//

import UIKit

extension UIViewController {
    func ShowAlert(message: messageModel) {
        let alert = UIAlertController(title: message.title, message: message.message, preferredStyle: .alert)
        
        for i in message.btnName {
            if i != "Dismiss" && i != "Cancel" {
                alert.addAction(UIAlertAction(title: i, style: .default, handler: { _ in
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)") // Prints true if the settings were opened successfully.
                        })
                    }
                }))
            }
            else {
                alert.addAction(UIAlertAction(title: i, style: .cancel))
            }
        }
        
        self.present(alert, animated: true)
    }
}
