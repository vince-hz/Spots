//
//  AppDelegate.swift
//  Spots
//
//  Created by 许允是 on 12/05/2019.
//  Copyright (c) 2019 许允是. All rights reserved.
//

import UIKit
import Spots
import PublicProtocols
import ModuleA

@UIApplicationMain
class AppDelegate: SpotsAppdelegate {
    
    var window: UIWindow?
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        SpotsManager.shared.context.environment = .develop
        
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        SpotsManager.shared.registerImp(ModuleAImp(), for: ModuleA.self)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ExamlpleVC()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

