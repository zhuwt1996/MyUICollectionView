//
//  CollectionKitVC.swift
//  MyUICollectionView
//
//  Created by ZWT on 2019/10/9.
//  Copyright © 2019 ZWT. All rights reserved.
//

import UIKit
import CollectionKit

class CollectionKitVC: UIViewController {

    var collectionView : CollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let dataSource = ArrayDataSource(data: [2])
        dataSource.data = [7, 8, 9]
        dataSource.data.append(10)
        dataSource.data.append(11)
        dataSource.data.append(12)
        
//        var a = [1, 2 ,3]
//        dataSource.data = a
//        a.append(5) // won't trigger an update be cause dataSource.data & a is now two different array.
//        a = [4 ,5 ,6] // also won't trigger an update
        let viewSource = ClosureViewSource(viewUpdater: { (view: UILabel, data: Int, index: Int) in
            view.backgroundColor = .red
            view.text = "\(data)"
            view.textAlignment = .center
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: 50, height: 50)
        }
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource
        )
        
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        provider.layout = FlowLayout(spacing: 10).transposed().inset(by: inset)
//        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        provider.layout = FlowLayout(spacing: 10).inset(by: inset)
//        provider.layout = FlowLayout(spacing: 10).transposed()
//        provider.layout = FlowLayout(spacing: 20, justifyContent: .center)
        //lastly assign this provider to the collectionView to display the content
        collectionView = CollectionView()
        collectionView.provider = provider
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({(make) in
            make.top.equalTo(200 * SCALE_WIDTH)
            make.bottom.left.right.equalToSuperview()
        })
        
    }
    

}
