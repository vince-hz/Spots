//
//  BridgeContext.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

public enum Environment {
    
    case develop
    case test
    case release
}

/// 全局上下文
public class SpotsContext {
    
    static let shared = SpotsContext()
    
    private init() {}
    
    public var environment: Environment = .develop
    
    public var launchOptions: [UIApplication.LaunchOptionsKey : Any]?
}

