//
//  LifeCycle.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

/// 子模块管理
class ModuleManager: NSObject, UIApplicationDelegate {
    
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
    
    // 非模块 事件响应者
    private var eventResponders: [SpotEventResponder] = []
    
    // 按顺序值重排后的模块数组
    var sortedModules: [SpotProtocol] = []
    
    /// 发起事件，可以由主模块Appdelegate下发，也可以由子模块主动触发
    func trigger(event: Event) {

        sortedModules.forEach { $0.handleEvent(event) }
        eventResponders.forEach { $0.handleEvent(event) }
    }
    
    // 增加事件响应者
    func addResponder(_ responder: SpotEventResponder) {
        let contain = eventResponders.contains { (item) -> Bool in
            return item === responder
        }
        if contain { return }
        eventResponders.append(responder)
    }
    
    // 去除响应者
    func removeResponder(_ responder: SpotEventResponder) {
        
        eventResponders.removeAll { (item) -> Bool in
            return item === responder
        }
    }
    
    /// 向对应的模块协议注册实现
    func registerImp(_ imp: SpotProtocol, for module: Any) {
        
        let des = String(describing: module)
        moduleDic[des] = imp
    }
    
    /// 获取模块协议的实现
    func dequeueImpFor(_ proto: Any)-> Any? {
        
        let des = String(describing: proto)
        let i = moduleDic[des]
        return i
    }
}
