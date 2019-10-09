//
//  MyUIColletionViewCell.swift
//  MyUICollectionView
//
//  Created by ZWT on 2019/10/9.
//  Copyright © 2019 ZWT. All rights reserved.
//

import UIKit

class MyUIColletionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 建立一個 UIImageView
//        imageView = UIImageView(frame: CGRect(x: 0, y: 0,width: SCALE_WIDTH/3 - 10.0, height: SCALE_WIDTH/3 - 10.0))
//        self.addSubview(imageView)
        
        // 建立一個 UILabel
        titleLabel = UILabel(frame: frame)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        self.contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
