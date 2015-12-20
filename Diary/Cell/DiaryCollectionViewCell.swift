//
//  DiaryCollectionViewCell.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/20.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

class DiaryCollectionViewCell: UICollectionViewCell {

    var textLabel: CXLabel!
    
    var labelText: String = "" {
        didSet {
            self.textLabel.updateText(labelText)
            self.textLabel.center = CGPointMake(itemWidth / 2.0, self.textLabel.center.y + 28)
        }
    }
    
    var textInt: Int = 0
    
    override func awakeFromNib() {
        
        let lineHeight: CGFloat = 5.0
        
        self.textLabel = CXLabel(fontName: "Wyue-GutiFangsong-NC", labelText: labelText, fontSize: 16.0, lineHeight: lineHeight)
        
        self.addSubview(textLabel)
    }
}
