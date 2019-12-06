//
//  Event.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

/// 生命周期事件，由宿主发起, 也可以由子模块发起
public enum Event {
    
    /// 初始化
    case setup
    
    /// 注册推送成功
    case didRegisterRemoteNotificationToken(token: Data)
    
    /// 收到远程通知
    case didReceiveRemoteNotification(info: [AnyHashable: Any])
    
    /// 进入后台
    case didEnterBackground
    
    /// 进入前台
    case didBecomeActive
    
    /// 退出应用
    case willTerminate
    
    /// 其他应用打开
    case openFrom(url: URL)
    
    /// 内存警告
    case receiveMemoryWarning
    
    /// 自定义事件
    case customEvent(value: Int)
}