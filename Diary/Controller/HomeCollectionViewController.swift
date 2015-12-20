//
//  HomeCollectionViewController.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/15.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

// cell的宽度
let itemWidth: CGFloat = 60
let itemHeight: CGFloat = 150.0
let collectionViewWidth = itemWidth * 3

class HomeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yearLayout = CXLayout()
        
        yearLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        self.collectionView?.setCollectionViewLayout(yearLayout, animated: false)
        
        self.collectionView!.frame = CGRect(x:0, y:0, width: collectionViewWidth, height: itemHeight)
        
        self.collectionView!.center = CGPoint(x: self.view.frame.size.width / 2.0, y: self.view.frame.size.height / 2.0)
        
        self.view.backgroundColor = UIColor.whiteColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> HomeYearCollectionViewCell {
        
        let reuseIdentifier = "HomeYearCollectionViewCell"
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomeYearCollectionViewCell
        
        cell.textInt = 2015
        
        cell.labelText = "二零一五 年"
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let identifier = "DiaryYearCollectionViewController"
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! DiaryYearCollectionViewController
        
        vc.year = 2015
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let leftRightMagrin = (collectionViewWidth - itemWidth)/2
        
        return UIEdgeInsetsMake(0, leftRightMagrin, 0, leftRightMagrin)
        
    }
    
    
}
