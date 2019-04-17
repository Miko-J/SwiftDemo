//
//  NJF_TabBarViewController.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/13.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

fileprivate let TabBarItemInfo = "TabBarItemConfig.plist"

class NJF_TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let itemUrl: String? = Bundle.main.path(forResource: TabBarItemInfo, ofType: nil)
        if itemUrl == nil {return}
        let dictItemArr: NSArray? = NSArray(contentsOfFile: itemUrl!)
        if dictItemArr == nil {return}
        dictItemArr?.enumerateObjects({ (obj, idx, stop) in
            //校验
            guard let itemDict = obj  as? [String : NSObject] else {return}
            let clsN: String = itemDict["vc"] as! String
            let cls: AnyClass? = classFromCls(clsN)
            if cls == nil {return}
            let vcCls = cls as! UIViewController.Type
            let vc = vcCls.init()
            addChildVC(vc, itemTitle: itemDict["title"] as! NSString, imageN: itemDict["normalImgeName"] as! NSString, selImageN: itemDict["selImgeName"] as! NSString)
        })
//        let homeVC = NJF_HomeViewController()
//        let cityVC = NJF_CityViewController()
//        let messageVC = NJF_MessageViewController()
//        let mineVC = NJF_MineViewController()
//        addChildVC(homeVC, itemTitle: "首页", imageN: "home_normal", selImageN: "home_highlight")
//        addChildVC(cityVC, itemTitle: "同城", imageN: "mycity_normal", selImageN: "mycity_highlight")
//        addChildVC(messageVC, itemTitle: "消息", imageN: "message_normal", selImageN: "message_highlight")
//        addChildVC(mineVC, itemTitle: "我的", imageN: "account_normal", selImageN: "account_highlight")
    }
}

extension NJF_TabBarViewController {
    fileprivate func addChildVC(_ vc: UIViewController, itemTitle: NSString, imageN: NSString, selImageN: NSString) {
        var image : UIImage = UIImage(named: imageN as String)!
        var selImage : UIImage = UIImage(named: selImageN as String)!
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        selImage = selImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        vc.tabBarItem = UITabBarItem.init(title: itemTitle as String, image: image, selectedImage: selImage)
        //改变字体颜色
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(r: 255, g: 211, b: 59)], for:.selected)
        vc.title = itemTitle as String
        let nav = NJF_NavigationViewController(rootViewController: vc)
        addChild(nav)
    }
}

