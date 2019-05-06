//
//  NJF_MineView.swift
//  SwiftDemo
//
//  Created by niujf on 2019/5/5.
//  Copyright © 2019 niujf. All rights reserved.
//

import UIKit
import SnapKit

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
        testLable.snp.makeConstraints { (make) in
            make.size.equalTo(200)
            make.center.equalToSuperview()
        }
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
