//
//  BridgeManager.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/6.
//

import Foundation

@objc public class SpotsManager: NSObject,UIApplicationDelegate {
    
    // MARK: - 单例
    
    private override init() {}
    
    public static let shared = SpotsManager()
    
    public var context: SpotsContext!
    
    // MARK: - Moduels
    
    public func registerImp(_ imp: SpotProtocol, for module: Any) {
        
        ModuleManager.shared.registerImp(imp, for: module)
    }
    
    public func dequeueImpFor(_ proto: Any)-> Any? {
        
        return ModuleManager.shared.dequeueImpFor(proto)
    }
}
