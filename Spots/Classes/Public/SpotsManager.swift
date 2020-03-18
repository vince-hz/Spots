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
    
    // 自定义区块， 一般用于把宿主事件提供给子模块调用
    private var customActions: [String: (()->Void)] = [:]
    
    public static let shared = SpotsManager()
    
    public var context: SpotsContext!
    
    // MARK: - Moduels
    
    public func registerImp(_ imp: SpotProtocol, for module: Any) {
        
        ModuleManager.shared.registerImp(imp, for: module)
    }
    
    public func dequeueImpFor(_ proto: Any)-> Any? {
        
        return ModuleManager.shared.dequeueImpFor(proto)
    }
    
    /// 增加事件响应者
    public func addEventResponder(_ responder: SpotEventResponder) {
        
        ModuleManager.shared.addResponder(responder)
    }
    
    /// 去除事件响应者
    public func removeEventResponder(_ responder: SpotEventResponder) {
        
        ModuleManager.shared.removeResponder(responder)
    }
    
    /// 主动发起事件
    public func trigger(event: Event) {
        
        ModuleManager.shared.trigger(event: event)
    }
    
    /// 注册宿主事件
    public func registerHostAction(_ action: @escaping (()->Void), for title: String) {
        customActions[title] = action
    }
    
    /// 同步请求跨模块数据
    public func syncRequestCrossModuleDataFor(identifier: String, otherInfo: [String: Any]?) -> [String: Any]? {
        return CrossModuleDataTransManager.shared.handleRequest(identifier: identifier, userInfo: otherInfo)
    }
    
    /// 注册跨模块调用的响应者
    public func registerCrossModuleDataHandler(_ handler: CrossModuleDataTransHandler) {
        CrossModuleDataTransManager.shared.registerResponder(handler)
    }
    
    /// 触发自定义事件
    public func triggerHostAction(with title: String) {
        if let block = customActions[title] {
            block()
        }
    }
}
