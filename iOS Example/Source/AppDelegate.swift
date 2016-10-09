//
//  AppDelegate.swift
//  iOS Example
//
//  Created by Jais Cheema on Oct 08, 2016.
//  Copyright © 2016 NeedleApps Pty Ltd. All rights reserved.
//

import UIKit
import JCRemoteDataSet

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = RemoteDataViewController<ItemList>()
        viewController.provider = ItemListProvider()
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
