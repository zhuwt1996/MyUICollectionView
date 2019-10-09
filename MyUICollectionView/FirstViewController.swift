//
//  FirstViewController.swift
//  MyUICollectionView
//
//  Created by ZWT on 2019/10/9.
//  Copyright © 2019 ZWT. All rights reserved.
//

import UIKit

//重用单元格identifier
private let cellIdentifier = "cell"
//设置代理
class FirstViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var fullScreenSize :CGSize!
    //声明一个collectionview
    var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreenSize = UIScreen.main.bounds.size
        
        self.view.backgroundColor = UIColor.white

        //设置layout流布局
        let layout = UICollectionViewFlowLayout()
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        // 設置每一行的間距
        layout.minimumLineSpacing = 5
        // 設置每個 cell 的尺寸
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width)/3 - 10.0, height: CGFloat(fullScreenSize.width)/3 - 10.0)
        // 設置 header 及 footer 的尺寸
        layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        
        
        //初始化collectionview
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        //注册cell
        collectionView?.register(MyUIColletionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        // 注册header和footer
        collectionView?.register(UICollectionReusableView.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: "Header")
        collectionView?.register(UICollectionReusableView.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,withReuseIdentifier: "Footer")
       
        //设置代理和数据源
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        view.addSubview(collectionView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//实现代理方法
extension FirstViewController{
    
    //设置section的个数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //点击cell后的触发事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("NO. \(indexPath.section + 1) section is selected")
        print("NO. \(indexPath.item + 1) pic is selected")
        
    }
    
    //返回每个section中的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //设置第indexPath个cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MyUIColletionViewCell
        
        cell.imageView.image = UIImage(named: "0\(indexPath.item + 1).jpg")
        cell.titleLabel.text = "0\(indexPath.item + 1)"
        
        return cell
    }
   
    // 設置 reuse 的 section 的 header 或 footer
    func collectionView(collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String,atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()
        
        // 顯示文字
        let label = UILabel(frame: CGRect(x: 0, y: 0,width: fullScreenSize.width, height: 40))
        label.textAlignment = .center
        
        // header
        if kind == UICollectionView.elementKindSectionHeader {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: "Header",for: indexPath as IndexPath)
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.darkGray
            label.text = "Header"
            label.textColor = UIColor.white
            
        } else if kind ==
            UICollectionView.elementKindSectionFooter {
            // 依據前面註冊設置的識別名稱 "Footer" 取得目前使用的 footer
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,withReuseIdentifier: "Footer",for: indexPath as IndexPath)
            // 設置 footer 的內容
            reusableView.backgroundColor = UIColor.cyan
            label.text = "Footer"
            label.textColor = UIColor.black
            
        }
        
        reusableView.addSubview(label)
        return reusableView
    }


}
