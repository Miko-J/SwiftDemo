//
//  UIView-Extension.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/18.
//  Copyright © 2019年 niujf. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    //获取视图的X坐标
    public var x:CGFloat{
        get{
            return self.frame.origin.x;
        }
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的Y坐标
    public var y:CGFloat{
        get{
            return self.frame.origin.y;
        }
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的宽
    public var width:CGFloat{
        get{
            return self.frame.size.width;
        }
        set{
            var frames = self.frame;
            frames.size.width = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的高
    public var height:CGFloat{
        get{
            return self.frame.size.height;
        }
        set{
            var frames = self.frame;
            frames.size.height = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取最大的X坐标
    public var maxX:CGFloat{
        get{
            return self.x + self.width;
        }
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue - self.width);
            self.frame = frames;
        }
    }
    
    //获取最大的Y坐标
    public var maxY:CGFloat{
        get{
            return self.y + self.height;
        }
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue - self.height);
            self.frame = frames;
        }
    }
    
    //中心点X坐标
    public var centerX:CGFloat{
        get{
            return self.center.x;
        }
        set{
            self.center = CGPoint(x:CGFloat(newValue),y:self.center.y);
        }
    }
    
    //中心点Y坐标
    public var centerY:CGFloat{
        get{
            return self.center.y;
        }
        set{
            self.center = CGPoint(x:self.center.x,y:CGFloat(newValue));
        }
    }
    
    /// 删除所有的子视图
    func removeAllSubView() -> Void {
        for view : UIView in self.subviews{
            view.removeFromSuperview();
        }
    }
    
    ///加载XIB文件
    public class func initWithXibName(xib:String) -> Any? {
        guard let nibs:Array = Bundle.main.loadNibNamed(xib, owner: nil, options: nil)else{
            return nil;
        }
        return nibs[0] ;
    }
    
    //设置边框
    func setBoardWithColor(color:UIColor,top:Bool,right:Bool,bottom:Bool,left:Bool,width:CGFloat) -> Void {
        if top == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: 0, width: self.width, height: width);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if right == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: self.width - width, y: 0, width: width, height: self.height);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if bottom == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: self.height - width, width: self.width, height: width);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if left == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: 0, width: width, height: self.height);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
    }
}
