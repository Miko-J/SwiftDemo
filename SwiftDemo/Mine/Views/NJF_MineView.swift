//
//  NJF_MineView.swift
//  SwiftDemo
//
//  Created by niujf on 2019/5/5.
//  Copyright © 2019 niujf. All rights reserved.
//

import UIKit

class NJF_MineView: UIView {
    
    var testStr: String? {
        didSet {
            testLable.text = testStr
        }
    }

    fileprivate lazy var testLable : UILabel = {
        let testLable = UILabel()
        testLable.textColor = UIColor.green
        return testLable;
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addChildView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        testLable.frame = CGRect(x: 50, y: 50, width: 200, height: 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NJF_MineView {
    fileprivate func addChildView(){
        addSubview(testLable)
    }
}
