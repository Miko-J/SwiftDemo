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
    private struct RuntimeKey {
        static let NJF_placeholderLabelKey = UnsafeRawPointer.init(bitPattern: "NJF_placeholderLabelKey".hashValue)
    }
    var placeholder: String {
        get {
            return self.placeHolderLable?.text ?? ""
        }
        set {
            self.placeHolderLable?.text = newValue
        }
    }
    var placeholderColor: UIColor {
        get {
            return self.placeHolderLable?.textColor ?? UIColor.black
        }
        set {
            self.placeHolderLable?.textColor = newValue
        }
    }
    private var placeHolderLable: UILabel?{
        get {
            var label = objc_getAssociatedObject(self, UITextView.RuntimeKey.NJF_placeholderLabelKey!) as? UILabel
            if label == nil {
                label = UILabel()
                label?.sizeToFit()
                label?.numberOfLines = 0
                label?.font = self.font
                label?.textColor = UIColor.lightGray
                self.addSubview(label!)
                self.setValue(label, forKey: "_placeholderLabel")
                objc_setAssociatedObject(self, UITextView.RuntimeKey.NJF_placeholderLabelKey!, label!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.sendSubviewToBack(label!)
            }
            return label
        }
        set {
            objc_setAssociatedObject(self, UITextView.RuntimeKey.NJF_placeholderLabelKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
   
}
