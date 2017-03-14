//
//  Photo.swift
//  SelfApp
//
//  Created by jorge luna on 10/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    
    var comment: String
    var image: UIImage
    
    class func all() -> [Photo] {
        var photos = [Photo]()
        if let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist") {
            if let photosFromPlist = NSArray(contentsOf: URL) {
                for dictionary in photosFromPlist {
                    let photo = Photo(dictionary: dictionary as! NSDictionary)
                    photos.append(photo)
                }
            }
        }
        return photos
    }
    
    init(comment: String, image: UIImage) {
        self.comment = comment
        self.image = image
    }
    
    convenience init(dictionary: NSDictionary) {
        let comment = dictionary["comment"] as? String
        let number = dictionary["number"] as? String
        let photo = "Image-" + number!
        let image = UIImage(named: photo)?.decompressedImage()
        self.init(comment: comment!, image: image!)
    }
    
    func heightForComment(font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: comment).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height)
    }
}
