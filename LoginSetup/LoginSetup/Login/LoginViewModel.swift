//
//  LoginViewModel.swift
//  LoginSetup
//
//  Created by Muhammad Taha on 04/08/2024.
//

import Foundation

protocol LoginViewModelCoordination {
    func login(user: User)
}

class LoginViewModel {

    private enum Constants {
        static let userName = "Username"
    }
    
    private struct State {
        var username: String?
        var password: String?
    }
    
    private var state = State()
    
    let coordinator: LoginViewModelCoordination
    
    init(coordinator: LoginViewModelCoordination) {
        self.coordinator = coordinator
    }
    
    private func login() {
        guard
            let username = state.username,
            let password = state.password else {
            print("Please enter all credentials")
            return
        }
        
        let user = User(username: username, password: password)
        
        if username == "Test" && password == "Password" {
            coordinator.login(user: user)
        } else {
            print("Invalid credentials")
        }
    }
}

extension LoginViewModel: LoginViewModelProtocol {
    var usernamePlaceholder: String { Constants.userName }
    
    var passwordPlaceholder: String { "Password" }
    
    var loginButtonViewModel: ButtonViewModel {
        .systemButton(
            title: "Login",
            action: { [weak self] in
                self?.login()
            }
        )
    }
    
    func didUpdateUsername(username: String?) {
        state.username = username
    }
    
    func didUpdatePassword(password: String?) {
        state.password = password
    }
}
