//
//  AppDelegate.swift
//  ConsumoAPI
//
//  Created by Jonathan Alajoan Rocha on 04/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UIStoryboard.buildTableViewController()
        window!.makeKeyAndVisible()
    }


}

