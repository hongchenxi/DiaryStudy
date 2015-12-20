//
//  CXLayout.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/15.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

class CXLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout() //准备布局
        
        let itemSize = CGSizeMake(itemWidth, itemHeight)
        self.itemSize = itemSize
        self.minimumInteritemSpacing = 0.0
        self.minimumLineSpacing = 0
    }
    
}
