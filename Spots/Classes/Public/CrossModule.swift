//
//  CrossModule.swift
//  Spots
//
//  Created by 许允是 on 2020/3/18.
//

import Foundation

class CrossModuleDataTransManager {
    
    static let shared = CrossModuleDataTransManager()
    
    private init() {}
    
    var responders: [CrossModuleDataTransHandler] = []
    
    func registerResponder(_ r: CrossModuleDataTransHandler) {
        responders.append(r)
    }
    
    func handleRequest(identifier: String, userInfo: [String: Any]?) -> [String: Any]? {
        
        for r  in responders {
            let value = r.respondToRequest(identifier: identifier, userInfo: userInfo)
            if let v = value {
                return v
            }
        }
        return nil
    }
}

// 跨模块调用的响应者
public protocol CrossModuleDataTransHandler {
    
    func respondToRequest(identifier: String, userInfo: [String: Any]?) -> [String: Any]?
}
