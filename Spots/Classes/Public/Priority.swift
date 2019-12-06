//
//  Priority.swift
//  Bridge
//
//  Created by 许允是 on 2019/11/7.
//

import Foundation

/// 模块处理优先级. max = Int.max, high = 9999, normal = 5000, low = 0, 默认normal
public enum Priority {
    
    case max
    
    case high
    
    case normal
    
    case low
    
    case custom(value: Int)
    
    var value: Int {
        switch self {
        case .max: return Int.max
        case .high: return 9999
        case .normal: return 5000
        case .low: return 0
        case .custom(value: let v): return v
        }
    }
}
