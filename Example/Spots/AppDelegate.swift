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

        let context = SpotsContext(url: URL(string: "http://s.com")!, environment: .develop)
        SpotsManager.shared.context = context
        
        _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        SpotsManager.shared.registerImp(ModuleAImp(), for: ModuleA.self)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ExamlpleVC()
        self.window?.makeKeyAndVisible()
        
        SpotsManager.shared.registerCrossModuleDataHandler(self)
        
        return true
    }
}


extension AppDelegate: CrossModuleDataTransHandler {
    
    func respondToRequest(identifier: String, userInfo: [String : Any]?) -> [String : Any]? {
        return ["value": "your identifier is \(identifier)", "info": userInfo ?? []]
    }
}
