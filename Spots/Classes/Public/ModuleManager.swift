//
//  LifeCycle.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

/// 子模块管理
public class ModuleManager: NSObject, UIApplicationDelegate {
    
    static let shared = ModuleManager()
    
    private override init() {}
    
    // 模块字典
    var moduleDic: [String: SpotProtocol] = [:] {
        didSet {
            var list = moduleDic.map { $0.value }
            list.sort { (m1, m2) -> Bool in
                m1.priority.value >= m2.priority.value
            }
            sortedModules = list
        }
    }
    
    // 按顺序值重排后的模块数组
    var sortedModules: [SpotProtocol] = []
    
    /// 发起事件，可以由主模块Appdelegate下发，也可以由子模块主动触发
    public func trigger(event: Event) {
        
        sortedModules.forEach { $0.handleEvent(event) }
    }
    
    /// 向对应的模块协议注册实现
    public func registerImp(_ imp: SpotProtocol, for module: Any) {
        
        let des = String(describing: module)
        moduleDic[des] = imp
    }
    
    /// 获取模块协议的实现
    public func dequeueImpFor(_ proto: Any)-> Any? {
        
        let des = String(describing: proto)
        let i = moduleDic[des]
        return i
    }
}
