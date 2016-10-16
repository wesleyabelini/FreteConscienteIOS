//
//  AppDelegate.swift
//  mom
//
//  Created by Gabriel Dezena on 15/10/16.
//  Copyright © 2016 Gabriel Dezena. All rights reserved.
//

import UIKit
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
//        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        let actions = [UNNotificationAction.init(identifier: "SIM", title: "SIM", options: UNNotificationActionOptions.foreground), UNNotificationAction.init(identifier: "NAO", title: "NAO", options: UNNotificationActionOptions.destructive)]
        
        let category = UNNotificationCategory(identifier: "MOM", actions: actions, intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
//        let action = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: [])
//        let category2 = UNNotificationCategory(identifier: "myCategory", actions: [action], intentIdentifiers: [], options: [])
//        UNUserNotificationCenter.current().setNotificationCategories([category2])
        UNUserNotificationCenter.current().delegate = self

        
        return true

    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "SIM"{
            print("DETALHES--------------------------------------------------->")
            
            let mainStoryboardIphone : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleriphone : UIViewController = mainStoryboardIphone.instantiateViewController(withIdentifier: "solicitacao") as! SolicitacaoViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = initialViewControlleriphone
            self.window?.makeKeyAndVisible()
        }
        else if response.actionIdentifier == "NAO" {
            print("MAPA-------------------------------------------------------->")
            
            
        }
        
    }
}

