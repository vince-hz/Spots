//
//  Event.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

/// 生命周期事件，由宿主发起, 也可以由子模块发起
public enum Event {
    
    /// 初始化(finishLaunch)
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
    
    /// universalLink
    case universalLink(activity: NSUserActivity)
    
    /// 内存警告
    case receiveMemoryWarning
    
    /// 登录成功
    case loginSuccess
    
    /// 退出登录
    case resignLogin
    
    /// 成为会员的通知
    case becomeVip
    
    /// 成为非会员的通知
    case becomeNoneVip
    
    /// 自定义事件
    case customEvent(value: Int)
}
