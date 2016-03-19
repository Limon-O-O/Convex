//
//  AppDelegate.swift
//  Example
//
//  Created by Limon on 3/19/16.
//  Copyright © 2016 Convex. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let tabBarControllerConfig = TabBarControllerConfig()
        window?.rootViewController = tabBarControllerConfig.tabBarController
        window?.makeKeyAndVisible()
        

        return true
    }


}

