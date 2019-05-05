//
//  NJF_MineViewController.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/13.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

class NJF_MineViewController: UIViewController {

    fileprivate lazy var mineView: NJF_MineView = {
        let mineView = NJF_MineView()
        return mineView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mineView)
    }
}

