//
//  NSObject-Extension.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/13.
//  Copyright © 2019年 niujf. All rights reserved.
//

import Foundation

extension NSObject {
    func classFromCls(_ clst: String) -> AnyClass? {
        assert(!clst.isEmpty, "传入的calss字符串为空")
        let clsB = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        let cls: AnyClass? = NSClassFromString(clsB! + "." + clst)
        return cls
    }
}

