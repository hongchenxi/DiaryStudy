//
//  HomeYearCollectionViewCell.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/15.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

class HomeYearCollectionViewCell: UICollectionViewCell {
 
    var textLabel: CXLabel!
    var textInt: Int = 0
    var labelText: String = ""{
        didSet{
            self.textLabel.updateText(labelText)
        }
    }
    
    
    override func awakeFromNib() {
        self.textLabel = CXLabel(fontName: "TpldKhangXiDictTrial", labelText: labelText, fontSize: 18, lineHeight: 6.0)
        self.addSubview(textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textLabel.center = CGPointMake(itemWidth/2.0, 150.0/2.0)
    }
}
