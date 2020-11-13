//
//  AppDelegate.swift
//  BMICalculator
//
//  Created by Behnam on 11/12/20.
//  Copyright © 2020 BehnamR. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1188176796, green: 0.1861543655, blue: 0.2486641407, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.9724641442, green: 0.9726034999, blue: 0.9724336267, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9724641442, green: 0.9726034999, blue: 0.9724336267, alpha: 1), NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .bold)]
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

