//
//  BridgeAppdelegate.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

open class SpotsAppdelegate: UIResponder, UIApplicationDelegate {
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        ModuleManager.shared.trigger(event: .setup)
        
        SpotsContext.shared.launchOptions = launchOptions
        
        return true
    }
    
    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        ModuleManager.shared.trigger(event: .didRegisterRemoteNotificationToken(token: deviceToken))
    }
    
    open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        ModuleManager.shared.trigger(event: .didReceiveRemoteNotification(info: userInfo))
    }
    
    open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        ModuleManager.shared.trigger(event: .receiveMemoryWarning)
    }
    
    open func applicationDidBecomeActive(_ application: UIApplication) {
        ModuleManager.shared.trigger(event: .didBecomeActive)
    }
    
    open func applicationDidEnterBackground(_ application: UIApplication) {
        ModuleManager.shared.trigger(event: .didEnterBackground)
    }
    
    open func applicationWillTerminate(_ application: UIApplication) {
        ModuleManager.shared.trigger(event: .willTerminate)
    }
    
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // 将来如果要做访问验证，可以修改
        ModuleManager.shared.trigger(event: .openFrom(url: url))
        return true
    }
}
