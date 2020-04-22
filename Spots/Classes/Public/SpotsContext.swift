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
    
    public init(url: URL, environment: Environment) {
        self.baseURL = url
        self.environment = environment
    }
    
    /// 是否社交电商
    public var isSocialMall: Bool = true
    
    /// 微信appid
    public var wxAppId: String?
    
    /// 主要提供给微信用
    public var universalLink: String?
    
    /// 微信secret
    public var wxSecret: String?
    
    /// 应用的Scheme(用于其他应用唤醒)
    public var appScheme: String?
    
    /// 业务url
    public var baseURL: URL
    
    /// 更新secret
    public var versionUpdateSecret: String?
    
    /// 环境
    public var environment: Environment
    
    public var launchOptions: [UIApplication.LaunchOptionsKey : Any]?
}

