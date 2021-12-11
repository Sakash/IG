//
//  AppDelegate.swift
//  IG_Assignment
//
//  Created by Sakshi Jain on 09/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let newsListVC: UIViewController = NewListViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = newsListVC
        self.window?.makeKeyAndVisible()
        return true
    }
}
