//
//  localAuthentication.swift
//  touchId
//
//  Created by Mohamed Ali on 22/04/2023.
//

import Foundation
import LocalAuthentication

class localAuthentication {
    
    static let instance = localAuthentication()
    
    private var context = LAContext()
    private var error: NSError? = nil
    
    private let msg = "We want to check you are correct person before make order"
    
    func ShowAuthentication(completion: @escaping (String) -> ()) {
        
        context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: msg) { response, error in
                
                guard error == nil else {
                    // failed
                    completion("Faild in Authorization")
                    return
                }
                
                completion("Success Authorization")

            }
        }
        else {
            completion("Faild in perimision")
        }
    }
}
