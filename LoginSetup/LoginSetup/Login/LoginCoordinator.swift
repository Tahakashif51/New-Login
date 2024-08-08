//
//  LoginVCCoordinator.swift
//  LoginSetup
//
//  Created by Muhammad Taha on 04/08/2024.
//

import UIKit

class Coordinator {
    let rootController: UINavigationController
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    open func start() {}
}


class LoginCoordinator: Coordinator {
    
    override func start() {
        presentLogin()
    }
    
    func presentLogin() {
        let loginViewModel = LoginViewModel(coordinator: self)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        
        rootController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginViewModelCoordination {
    func login(user: User) {
        let HomeVC = UIViewController()
        HomeVC.view.backgroundColor = .white
        HomeVC.title = "Welcome Home"
        rootController.pushViewController(HomeVC, animated: true)
    }
}
