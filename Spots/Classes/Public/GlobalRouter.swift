//
//  CommonRouter.swift
//  Spots
//
//  Created by 许允是 on 2020/4/8.
//

import Foundation

public protocol GlobalRouter {
    
    func handleCommonEvent(type: Int, param: String)
}
