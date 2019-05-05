//
//  NJF_HomeTableViewCell.swift
//  SwiftDemo
//
//  Created by niujf on 2019/5/5.
//  Copyright © 2019 niujf. All rights reserved.
//

import UIKit

fileprivate let homeCellID = "homeCellID"

class NJF_HomeTableViewCell: UITableViewCell {
    
    var testLable : UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addChildView()
        layoutChildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NJF_HomeTableViewCell {
    fileprivate func addChildView(){
       testLable = UILabel()
       testLable?.textColor = UIColor.green
       contentView.addSubview(testLable!)
    }
}

extension NJF_HomeTableViewCell {
    fileprivate func layoutChildView(){
        testLable?.frame = CGRect(x: 10, y: 0, width: bounds.size.width - 10, height: bounds.size.height)
    }
}

extension NJF_HomeTableViewCell {
    class func homeCellWithTableView(_ tableview: UITableView) -> UITableViewCell{
        var cell = tableview.dequeueReusableCell(withIdentifier: homeCellID) as? NJF_HomeTableViewCell
        if cell == nil {
            cell = NJF_HomeTableViewCell(style: .default, reuseIdentifier: homeCellID)
        }
        return cell!
    }
}
