//
//  DiaryMonthDayCollectionViewController.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/21.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DiaryCollectionViewCell"

class DiaryMonthDayCollectionViewController: UICollectionViewController {

    var month: Int!
    
    var year: Int!
    
    var yearLabel: UILabel!
    
    var composeButton: UIButton!
    
    var monthLabel: CXLabel!
    
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
        
        composeButton = diaryButtonWith(text: "撰",  fontSize: 14.0,  width: 40.0,  normalImageName: "Oval", highlightedImageName: "Oval_pressed")
        
        composeButton.center = CGPointMake(screenRect.width - yearLabel.frame.size.width/2.0 - 15, 38 + yearLabel.frame.size.height + 26.0/2.0)
        
        composeButton.addTarget(self, action: "newCompose", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(composeButton)
        
        //月
        monthLabel = CXLabel(fontName: "Wyue-GutiFangsong-NC", labelText: "\(numberToChineseWithUnit(month))月", fontSize: 16.0, lineHeight: 5.0)
        
        monthLabel.frame = CGRectMake(screenRect.width - 15.0 - monthLabel.frame.size.width, (screenRect.height - 150) / 2.0, monthLabel.frame.size.width, monthLabel.frame.size.height)
        
        monthLabel.center = CGPointMake(composeButton.center.x, monthLabel.center.y + 28)
        
        monthLabel.updateLabelColor(DiaryRed)
        
        monthLabel.userInteractionEnabled = true
        
        let mmTapUpRecognizer = UITapGestureRecognizer(target: self, action: "backToYear")
        mmTapUpRecognizer.numberOfTapsRequired = 1
        monthLabel.addGestureRecognizer(mmTapUpRecognizer)
    
        self.view.addSubview(monthLabel)
        
        
        let yearLayout = CXLayout()
        
        yearLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        self.collectionView?.setCollectionViewLayout(yearLayout, animated: false)
        
        self.collectionView?.frame = CGRectMake(0, 0, collectionViewWidth, itemHeight)
        
        self.collectionView?.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0)
        
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
        
        cell.labelText = "二十一 日"
        
        cell.textInt = 21
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let leftRightMagrin = (collectionViewWidth - itemWidth)/2
        
        return UIEdgeInsetsMake(0, leftRightMagrin, 0, leftRightMagrin);
    }



}
