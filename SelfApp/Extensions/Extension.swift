//
//  Extension.swift
//  SelfApp
//
//  Created by jorge luna on 10/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit

// MARK: -
extension UIFont {
    class func normal() -> UIFont {
        /*
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
        */
        
        guard let normal = UIFont(name: "Unispace-Regular", size: 16.0) else {
            return UIFont.systemFont(ofSize: 16.0)
        }
        return normal
    }
    
    class func normalBold() -> UIFont {
        guard let normal = UIFont(name: "Unispace-Bold", size: 16.0) else {
            return UIFont.systemFont(ofSize: 16.0)
        }
        return normal
    }
    
    class func large() -> UIFont {
        guard let normal = UIFont(name: "Unispace-Regular", size: 18.0) else {
            return UIFont.systemFont(ofSize: 18.0)
        }
        return normal
    }
    
    class func largeBold() -> UIFont {
        guard let normal = UIFont(name: "Unispace-Bold", size: 18.0) else {
            return UIFont.systemFont(ofSize: 18.0)
        }
        return normal
    }
    
    class func short() -> UIFont {
        guard let normal = UIFont(name: "Unispace-Regular", size: 12.0) else {
            return UIFont.systemFont(ofSize: 12.0)
        }
        return normal
    }
    
    class func shortBold() -> UIFont {
        guard let normal = UIFont(name: "Unispace-Bold", size: 12.0) else {
            return UIFont.systemFont(ofSize: 12.0)
        }
        return normal
    }
}

// MARK: -
extension UIImage {
    func decompressedImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
    }
}

// MARK: -
extension UIColor {
    class func first() -> UIColor {
        //FF9800
        return UIColor(colorLiteralRed: 255/255, green: 152/255, blue: 0/255, alpha: 1.0)
    }
    
    class func second() -> UIColor {
        //FFF3E0
        return UIColor(colorLiteralRed: 255/255, green: 243/255, blue: 224/255, alpha: 1.0)
    }
}
