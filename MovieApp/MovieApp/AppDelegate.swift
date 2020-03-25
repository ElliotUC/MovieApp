//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Elliot on 3/25/20.
//  Copyright © 2020 Elliot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = Coordinator(window: window!)
        coordinator?.start()
        
        return true
    }

}

