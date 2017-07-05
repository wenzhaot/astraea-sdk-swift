//
//  AppDelegate.swift
//  Catalog
//
//  Created by wenzhaot on 30/06/2017.
//  Copyright © 2017 yueke. All rights reserved.
//

import UIKit
import AstraeaSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppConfig.start(with: nil)
        AppConfig.setAppConfigDelegate(delegate: self)
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

extension AppDelegate: AppConfigDelegate {
    
    func requestLogin(from controller: UIViewController?) {
        let alert = UIAlertController(title: "是否转换为DUDU账户", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "确定", style: .default) { (alert) in
            self.bindUser()
        }
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func bindUser() {
        AppConfig.bindUser(
            userId: "test-123",
            mobile: "18618439364",
            nickname: "吸管",
            avatar: "http://tva3.sinaimg.cn/crop.0.7.1243.1243.180/71894349jw8fa9dof3ylej20yj0yxq5e.jpg",
            gender: 1) { (error) in
                
        }
    }
    
    /// 分享回调
    func willBeginShare(with shareLink: String, title: String, summary: String, imageUrl: String, from controller: UIViewController?) {
        
    }
    
    /// 播放视频
    func willPlayVideo(with url: String, from controller: UIViewController?) {
        
    }
    
}

