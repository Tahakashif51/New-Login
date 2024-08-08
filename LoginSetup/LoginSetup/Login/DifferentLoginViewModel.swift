//
//  DifferentLogin.swift
//  LoginSetup
//
//  Created by Alex Yushchenko on 05/08/2024.
//

import Foundation

class DifferentLoginViewModel {
    func loginV2(username: String?, password: String?) {
        guard let username = username, let password = password else { return }
        
        let user = User(username: username, password: password)
        
        if username == "Test" && password == "Password" {
            coordinator.didLogin(user: user)
        } else {
            print("Invalid credentials")
        }
    }
}
