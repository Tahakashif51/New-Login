//
//  LoginVC.swift
//  LoginSetup
//
//  Created by Muhammad Taha on 03/08/2024.
//

import UIKit

protocol LoginViewModelProtocol {
    var usernamePlaceholder: String { get }
    var passwordPlaceholder: String { get }
    var loginButtonViewModel: ButtonViewModel { get }
    
    func didUpdateUsername(username: String?)
    func didUpdatePassword(password: String?)
}

class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
     let loginButton = BasicButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureHierarchy()
        configureLayout()
        configureBindings()
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func configureHierarchy() {
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    private func configureLayout() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: Layout.largePadding),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Layout.largePadding)
        ])
    }
    
    private func configureBindings() {
        loginButton.configure(viewModel.loginButtonViewModel)
        usernameTextField.placeholder = viewModel.usernamePlaceholder
        passwordTextField.placeholder = viewModel.passwordPlaceholder
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = NSString(string: textField.text ?? "")
        let newText = currentText.replacingCharacters(
            in: range,
            with: string
        )
        
        if textField == usernameTextField {
            viewModel.didUpdateUsername(username: newText)
        } else {
            viewModel.didUpdatePassword(password: newText)
        }
        
        return true
    }
}
