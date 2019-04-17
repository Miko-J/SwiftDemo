//
//  UIBarButtonItem-Extension.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/17.
//  Copyright © 2019年 niujf. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    //便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName:String, higImageName:String = "", size:CGSize = .zero, target: UIViewController, action: Selector) {
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        if higImageName != "" {
            btn.setImage(UIImage(named:higImageName), for: .highlighted)
        }
        if size == .zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: .zero, size: size)
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
}
