//
//  AppDelegate.swift
//  weibo
//
//  Created by 任玉飞 on 16/4/25.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame:UIScreen.mainScreen().bounds )
        window?.backgroundColor = UIColor.whiteColor()
        
        let key = "CFBundleShortVersionString"
        
        let sanboxVersion = NSUserDefaults.standardUserDefaults().objectForKey("CFBundleShortVersionString") as? String ?? ""
        let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
        print(sanboxVersion)
        print(currentVersion)
//        if !currentVersion.isEqualToString(sanboxVersion!) {
//            NSUserDefaults.standardUserDefaults().setValue(currentVersion, forKey: key)
//            window?.rootViewController = NewFeatureViewController()
//        }else{
            window?.rootViewController = RYFViewController()
            
//        }
        window?.makeKeyAndVisible()
//        NSBundle.mainBundle().infoDictionary
        // Override point for customization after application launch.
        return true
    }

   

}

