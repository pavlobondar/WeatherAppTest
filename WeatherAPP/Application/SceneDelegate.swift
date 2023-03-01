//
//  SceneDelegate.swift
//  WeatherAPP
//
//  Created by Pavlo on 28.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let weatherTableViewController = WeatherTableViewController()
        let navigationController = UINavigationController(rootViewController: weatherTableViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.topItem?.title = "Weather"
        navigationController.navigationItem.largeTitleDisplayMode = .always
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

