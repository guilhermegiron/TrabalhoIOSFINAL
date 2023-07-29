//
//  SceneDelegate.swift
//  final_project
//
//  Created by Jackson on 11/08/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        let mainCoordinator = MainCoordinator()
        
        window?.rootViewController = navigationController
        mainCoordinator.navigationController = navigationController
        
        window?.makeKeyAndVisible()
        
        mainCoordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

