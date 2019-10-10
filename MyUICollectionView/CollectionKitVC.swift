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
        
        let dataSource = ArrayDataSource(data: [1, 2, 3, 4])
        dataSource.data = [7, 8, 9]
        dataSource.data.append(10)
        dataSource.data.append(11)
        dataSource.data.append(12)
        let viewSource = ClosureViewSource(viewUpdater: { (view: UILabel, data: Int, index: Int) in
            view.backgroundColor = .red
            view.text = "\(data)"
            view.textAlignment = .center
        })
        let sizeSource = { (index: Int, data: Int, collectionSize: CGSize) -> CGSize in
            return CGSize(width: 100, height: 100)
        }
        let provider = BasicProvider(
            dataSource: dataSource,
            viewSource: viewSource,
            sizeSource: sizeSource
        )
        
        provider.layout = FlowLayout(spacing: 10, justifyContent: .center)
        //lastly assign this provider to the collectionView to display the content
        collectionView = CollectionView()
        collectionView.provider = provider
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints({(make) in
            make.top.bottom.left.right.equalToSuperview()
        })
    }
    

}
