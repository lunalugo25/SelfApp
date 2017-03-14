//
//  PhotoCollectionViewCell.swift
//  SelfApp
//
//  Created by jorge luna on 10/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelComment: UILabel!
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
                labelComment.text = photo.comment
            }
        }
    }
}
