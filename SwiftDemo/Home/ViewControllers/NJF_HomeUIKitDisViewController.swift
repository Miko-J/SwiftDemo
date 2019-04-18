//
//  NJF_HomeUIKitDisViewController.swift
//  SwiftDemo
//
//  Created by niujf on 2019/4/17.
//  Copyright © 2019年 niujf. All rights reserved.
//

import UIKit

fileprivate let KItemMargin : CGFloat = 10
fileprivate let KitemW = (KscreenWidth - KItemMargin * 3) / 2
fileprivate let KitemH = KitemW * 6 / 5
fileprivate let KCollectionCellID = "KCollectionCellID"

enum UIKitType{
    case UIKitTypeLable
    case UIKitTypeButton
    case UIKitTypeImageView
    case UIKitTypeTextView
    case UIKitTypeCollectionView
}

class NJF_HomeUIKitDisViewController: UIViewController {
    
    var kitType : UIKitType?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "UIKit控件的简单使用"
        kitDis()
    }
}

extension NJF_HomeUIKitDisViewController {
    fileprivate func kitDis() {
        if kitType == .UIKitTypeLable {
            let lable = UILabel()
            lable.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            lable.text = "我是一个lable"
            lable.textColor = UIColor.orange
            lable.numberOfLines = 0
            lable.textAlignment = .center
            view.addSubview(lable)
        }
        if kitType == .UIKitTypeButton {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            btn.setTitle("我是btn", for: .normal)
            btn.setTitleColor(UIColor.orange, for: .normal)
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            btn.setBackgroundImage(UIImage(named: "btnBackImage"), for: .normal)
            btn.adjustsImageWhenHighlighted = false
            view.addSubview(btn)
        }
        if kitType == .UIKitTypeImageView {
            let imageView = UIImageView(image: UIImage(named: "imageBack"))
            imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100);
            view.addSubview(imageView)
        }
        if kitType == .UIKitTypeTextView {
            let textView = UITextView()
            textView.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
            textView.placeholder = "我是textView的placeholder"
            textView.placeholderColor = UIColor.green
            textView.font = UIFont.systemFont(ofSize: 15)
            textView.textColor = UIColor.orange
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.orange.cgColor
            view.addSubview(textView)
        }
        if kitType == .UIKitTypeCollectionView {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: KitemW, height: KitemH)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .vertical
            let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
            collectionView.contentInset = UIEdgeInsets(top: 0, left: KItemMargin, bottom: 0, right: KItemMargin)
            collectionView.backgroundColor = UIColor.white
            //注册cell
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: KCollectionCellID)
            collectionView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
            collectionView.dataSource = self
            view.addSubview(collectionView)
        }
    }
    
    @objc fileprivate func btnClick(btn:UIButton){
        print("点击了btn")
        btn.isSelected = !btn.isSelected
        btn.setTitleColor(btn.isSelected ? UIColor.red : UIColor.orange, for: .normal)
    }
}

extension NJF_HomeUIKitDisViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KCollectionCellID, for: indexPath)
        cell.backgroundColor = UIColor.andomColor()
        return cell
    }
}
