//
//  NJF_HomeUIKitDisViewController.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/17.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

enum UIKitType{
    case UIKitTypeLable
    case UIKitTypeButton
    case UIKitTypeImageView
    case UIKitTypeTextView
}

class NJF_HomeUIKitDisViewController: UIViewController {
    
    var kitType : UIKitType?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "UIKit控件的简单使用"
        kitDis()
    }
}

extension NJF_HomeUIKitDisViewController {
    fileprivate func kitDis() {
        if kitType == .UIKitTypeLable {
            print("点击了lable")
        }
        if kitType == .UIKitTypeButton {
            print("点击了button")
        }
        if kitType == .UIKitTypeImageView {
            print("点击了imageView")
        }
        if kitType == .UIKitTypeTextView {
            print("点击了textView")
        }
    }
}
