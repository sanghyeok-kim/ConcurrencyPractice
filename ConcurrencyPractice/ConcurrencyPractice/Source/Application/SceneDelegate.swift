//
//  SceneDelegate.swift
//  ConcurrencyPractice
//
//  Created by κΉμν on 2023/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let initialViewController = MainViewController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
}

