//
//  UITextView-Extension.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/17.
//  Copyright © 2019年 niujf. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    var placeHolderLable: UILabel?{
        get {
            let lable = UILabel()
            lable.sizeToFit()
            lable.numberOfLines = 0
            self.addSubview(lable)
            self.setValue(lable, forKey: "_placeholderLabel")
            return lable
        }
    }
}
