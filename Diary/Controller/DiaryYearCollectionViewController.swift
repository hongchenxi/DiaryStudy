//
//  DiaryYearCollectionViewController.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/20.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DiaryCollectionViewCell"

class DiaryYearCollectionViewController: UICollectionViewController {

    var year:Int!
    var yearLabel: UILabel!
    var composeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearLabel = CXLabel(fontName: "TpldKhangXiDictTrial", labelText: "\(numberToChinese(year))年", fontSize: 20.0, lineHeight: 5.0)
        
        yearLabel.center = CGPointMake(screenRect.width - yearLabel.frame.size.width / 2.0 - 15, 20 + yearLabel.frame.size.height / 2.0)
        
        self.view.addSubview(yearLabel)
        
        yearLabel.userInteractionEnabled = true
        
        let mTapUpRecognizer = UITapGestureRecognizer(target: self, action: "backToHome")
        
        mTapUpRecognizer.numberOfTapsRequired = 1
        
        yearLabel.addGestureRecognizer(mTapUpRecognizer)
        
        //添加“撰”button
        composeButton = diaryButtonWith(text: "撰", fontSize: 14.0, width: 40.0, normalImageName: "Oval", highlightedImageName: "Oval_pressed")
        
        composeButton.center = CGPointMake(screenRect.width - yearLabel.frame.size.width / 2.0 - 15, 38 + yearLabel.frame.size.height + 26.0 / 2)
        
        composeButton.addTarget(self, action: "newCompose", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(composeButton)
        
        let yearLayout = CXLayout()
        
        yearLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        self.collectionView?.setCollectionViewLayout(yearLayout, animated: false)
        
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: collectionViewWidth, height: itemHeight)
        
        self.collectionView?.center = CGPointMake(self.view.frame.size.width / 2.0 , self.view.frame.size.height / 2.0)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! DiaryCollectionViewCell
        
        cell.labelText = "十二月"
        
        cell.textInt = 12
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        _ = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! DiaryCollectionViewCell
        
        let dev = self.storyboard?.instantiateViewControllerWithIdentifier("DiaryMonthDayCollectionViewController") as! DiaryMonthDayCollectionViewController
        dev.year = year
        dev.month = 12
        self.navigationController?.pushViewController(dev, animated: true)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightMagrin = (collectionViewWidth - itemWidth)/2
        return UIEdgeInsetsMake(0, leftRightMagrin, 0, leftRightMagrin);
    }

}
