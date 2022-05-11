//
//  AppDelegate.swift
//  ChuckNorrisFacts
//
//  Created by Carlos Barcelos on 22/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let mainView = FactsViewController()
        navigationController.viewControllers = [mainView]
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

}


