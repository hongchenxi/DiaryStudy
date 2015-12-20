
//
//  DiaryHelper.swift
//  Diary(CollectionView)
//
//  Created by cx on 15/12/20.
//  Copyright © 2015年 cx. All rights reserved.
//

import UIKit

let screenRect = UIScreen.mainScreen().bounds

let DiaryRed = UIColor(red: 192.0/255.0, green: 23.0/255.0, blue: 48.0/255.0, alpha: 1.0)

func diaryButtonWith(text text:String, fontSize: CGFloat, width: CGFloat, normalImageName: String, highlightedImageName: String) -> UIButton {
    
    let button = UIButton(type: UIButtonType.Custom)
    button.frame = CGRectMake(0, 0, width, width)
    
    let font = UIFont(name: "Wyue-GutiFangsong-NC", size: fontSize) as UIFont!
    let textAttributes: [String: AnyObject] = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.whiteColor()]
    let attributedText = NSAttributedString(string: text, attributes: textAttributes)
    
    button.setAttributedTitle(attributedText, forState: UIControlState.Normal)
    button.setBackgroundImage(UIImage(named: normalImageName), forState: UIControlState.Normal)
    button.setBackgroundImage(UIImage(named: highlightedImageName), forState: UIControlState.Highlighted)
    
    return button
    
}


func numberToChinese(number:Int) -> String {
    let numbers = Array(String(number).characters)
    var finalString = ""
    for singleNumber in numbers {
        let string = singleNumberToChinese(singleNumber)
        finalString = "\(finalString)\(string)"
    }
    return finalString
}

func numberToChineseWithUnit(number:Int) -> String {
    let numbers = Array(String(number).characters)
    var units = unitParser(numbers.count)
    var finalString = ""
    
    for (index, singleNumber) in numbers.enumerate() {
        let string = singleNumberToChinese(singleNumber)
        if (!(string == "零" && (index+1) == numbers.count)){
            finalString = "\(finalString)\(string)\(units[index])"
        }
    }
    
    return finalString
}


func unitParser(unit: Int) -> [String] {
    
    var units = Array(["万", "千", "百", "十", ""].reverse())
    let parsedUnits = units[0..<(unit)].reverse()
    let slicedUnits: ArraySlice<String> = ArraySlice(parsedUnits)
    let final: [String] = Array(slicedUnits)
    return final
    
}


func singleNumberToChinese(number:Character) -> String {
    
    switch number {
        case "0":
            return "零"
        case "1":
            return "一"
        case "2":
            return "二"
        case "3":
            return "三"
        case "4":
            return "四"
        case "5":
            return "五"
        case "6":
            return "六"
        case "7":
            return "七"
        case "8":
            return "八"
        case "9":
            return "九"
        default:
            return ""
        
    }
}