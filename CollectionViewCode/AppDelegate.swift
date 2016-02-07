//
//  AppDelegate.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/10/18.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//            // first time to launch this app
////        var tutorialCheck = defaults.objectForKey("first") as! Bool
//        let defaults = NSUserDefaults.standardUserDefaults()
////        var udid: AnyObject = defaults.objectForKey("first")
//        
//        let storyboard:UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
//        var VC :UIViewController = storyboard.instantiateViewControllerWithIdentifier("main") as UIViewController
//        
//        
////        var tutorialCheck = true
//        print(defaults.objectForKey("first") as! Bool)
//        if defaults.objectForKey("first") as! Bool{
//            VC  = storyboard.instantiateViewControllerWithIdentifier("main") as UIViewController
////            defaults.setObject(false, forKey: "first")
//        }else{
//            defaults.setObject(true, forKey: "first")
//            VC  = storyboard.instantiateViewControllerWithIdentifier("tutorial") as UIViewController
//        }
//
//        // Override point for customization after application launch.
//        
//        window?.rootViewController = VC
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

