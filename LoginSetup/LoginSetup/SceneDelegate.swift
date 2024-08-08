//
//  SceneDelegate.swift
//  LoginSetup
//
//  Created by Muhammad Taha on 03/08/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: LoginCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let coordinator = LoginCoordinator()
        self.coordinator = coordinator
        coordinator.start()
        
        window.rootViewController = coordinator.navigationController
        window.makeKeyAndVisible()
    }

}
