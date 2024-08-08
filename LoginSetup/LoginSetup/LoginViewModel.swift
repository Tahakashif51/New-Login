//
//  LoginViewModel.swift
//  LoginSetup
//
//  Created by Muhammad Taha on 04/08/2024.
//

import Foundation

class LoginViewModel {
    
    let coordinator: LoginCoordinator
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func login(username: String?, password: String?) {
        guard let username = username, let password = password else { return }
        
        let user = User(username: username, password: password)
        
        if username == "Test" && password == "Password" {
            coordinator.didLogin(user: user)
        } else {
            print("Invalid credentials")
        }
    }
}
