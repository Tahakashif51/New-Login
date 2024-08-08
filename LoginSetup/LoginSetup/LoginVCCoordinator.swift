//
//  LoginVCCoordinator.swift
//  LoginSetup
//
//  Created by Muhammad Taha on 04/08/2024.
//

import UIKit

class LoginCoordinator {
    
    var navigationController: UINavigationController?
    
    func start() {
        let loginVC = LoginViewController()
        let viewModel = LoginViewModel(coordinator: self)
        loginVC.viewModel = viewModel
        
        navigationController = UINavigationController(rootViewController: loginVC)
    }
    
    func didLogin(user: User) {
        let HomeVC = UIViewController()
        HomeVC.view.backgroundColor = .white
        HomeVC.title = "Welcome Home"
        navigationController?.pushViewController(HomeVC, animated: true)
    }
}
