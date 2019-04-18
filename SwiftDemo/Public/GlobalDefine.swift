//
//  GlobalDefine.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/18.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

/************************application相关*******************/
/// 当前app版本号
let KAppCurrentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
/// 当前app的build号
let KAppBuildVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
/// 获取设备当前系统
let KSystemVersion = UIDevice.current.systemVersion

/************************屏幕坐标、尺寸相关*******************/

let IS_IPHONE4  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:640,height:960), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONE5  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:640,height:1336), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONE6  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:750,height:1334), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONE6P  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1242,height:2208), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONE6PBigMode = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2001), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONEX = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2436), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONEXR = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:828,height:1792), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONEXSM  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1242,height:2688), (UIScreen.main.currentMode?.size)!) : false
let IS_IPHONEXAll = (IS_IPHONEX||IS_IPHONEXR||IS_IPHONEXSM)

//适配参数
let suitParm:CGFloat = ((IS_IPHONE6||IS_IPHONEXR||IS_IPHONEXSM) ? 1.12 : (IS_IPHONE6 ? 1.0 : (IS_IPHONE6PBigMode ? 1.01 : (IS_IPHONEX ? 1.0 : 0.85))))

let KscreenWidth = UIScreen.main.bounds.width
let KscreenHeight = UIScreen.main.bounds.height

let kNavigationBarHeight = 44.0
let kStatusBarHeight = IS_IPHONEXAll ? 44.0 : 20.0
let kSafeAreaTopHeight = IS_IPHONEXAll ? 88.0 : 64.0
let kSafeAreaBottomHeight = IS_IPHONEXAll ? 34.0 : 0
let kTabbarHeight = 49.0

