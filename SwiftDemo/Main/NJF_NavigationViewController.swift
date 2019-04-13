//
//  NJF_NavigationViewController.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/13.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

class NJF_NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //隐藏底部tabBar
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
