//
//  NJF_HomeViewController.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/13.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

fileprivate let homeCellID = "homeCellID"

class NJF_HomeViewController: UIViewController {
   //mark - 懒加载
    fileprivate lazy var tableview : UITableView = {[unowned self] in
        let tableview = UITableView(frame: view.bounds, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview;
    }()
    fileprivate lazy var dataArr : NSArray = {
        return ["lable","button","imageView","textView","collectionView"]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        
        //利用运行时机制查看所有的属性名称
        /*
         var count : UInt32 = 0
         let ivars = class_copyIvarList(UITextView.self, &count)!
         for i in 0..<count {
         let ivar = ivars[Int(i)]
         let name = ivar_getName(ivar)
         print(String(cString: name!))
         }
         */
    }
}

extension NJF_HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NJF_HomeTableViewCell.homeCellWithTableView(tableview) as? NJF_HomeTableViewCell
        cell?.testLable?.text = dataArr[indexPath.row] as? String
        return cell!
    }
}

extension NJF_HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let uikitDisVC = NJF_HomeUIKitDisViewController()
        if indexPath.row == 0 {
            uikitDisVC.kitType = .UIKitTypeLable
        }
        if indexPath.row == 1 {
            uikitDisVC.kitType = .UIKitTypeButton
        }
        if indexPath.row == 2 {
            uikitDisVC.kitType = .UIKitTypeImageView
        }
        if indexPath.row == 3 {
            uikitDisVC.kitType = .UIKitTypeTextView
        }
        if indexPath.row == 4 {
            uikitDisVC.kitType = .UIKitTypeCollectionView
        }
        self.navigationController!.pushViewController(uikitDisVC, animated: true)
    }
}
