//
//  AppDelegate.swift
//  BaseTabBarCustom
//
//  Created by Quoc Nguyen Vuong on 04/12/2024.
//

import UIKit
import AMTabView

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Customize the colors
        AMTabView.settings.ballColor = UIColor(hex: "C07298")
        AMTabView.settings.tabColor = UIColor(hex: "FEFEFE")
        AMTabView.settings.selectedTabTintColor = UIColor(hex: "FFFFFF")
        AMTabView.settings.unSelectedTabTintColor = UIColor(hex: "000000")
        
        AMTabView.settings.animationDuration = 1
        
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

