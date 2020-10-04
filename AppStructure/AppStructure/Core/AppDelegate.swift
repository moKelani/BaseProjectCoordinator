//
//  AppDelegate.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    // Make the first coordinator with a strong reference
    var usersCoordinator : UsersCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        // Initialise the first coordinator with the main navigation controller
        usersCoordinator = UsersCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        
        // The start method will actually display the main view
        usersCoordinator?.start()
        
        window?.makeKeyAndVisible()
        return true
    }

   


}

