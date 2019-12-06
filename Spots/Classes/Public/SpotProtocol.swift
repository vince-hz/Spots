//
//  Module.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/6.
//

import Foundation
import UIKit

/// 模块根协议，遵循此协议的模块才可以被注册
public protocol SpotProtocol {
    
    var priority: Priority { get }
    
    func handleEvent(_ event: Event)
}

extension SpotProtocol {
    
    public var priority: Priority { return .normal }
}
