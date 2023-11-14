//
//  AppDelegate.swift
//  AppTheWeather - 3.0
//
//  Created by Максим Самороковский on 20.09.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = CityAssemble.setup()
        window?.backgroundColor = #colorLiteral(red: 0.2527489662, green: 0.4839937687, blue: 0.7125120759, alpha: 1)
        window?.makeKeyAndVisible()
        
        return true
    }

}

