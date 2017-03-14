//
//  ProjectCell.swift
//  SelfApp
//
//  Created by jorge luna on 12/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit

class ProjectCell: FoldingCell {

    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var nameCell: UILabel!
    @IBOutlet var companyCell: UILabel!
    
    @IBOutlet var nameDetail: UILabel!
    @IBOutlet var companyDetail: UILabel!
    @IBOutlet var imageDetail: UIImageView!
    
    @IBOutlet var descriptionDetail: UITextView!
    @IBOutlet var challenge: UITextView!
    
    var frameworks = [String]()
    
    @IBOutlet var frameworkCollection: UICollectionView!
    
    var application:Application? {
        didSet {
            if let application = application {
                nameCell.text = application.name
                companyCell.text = application.company
                imageCell.image = application.image
                
                nameDetail.text = application.name
                companyDetail.text = application.company
                imageDetail.image = application.image
                
                let description = application.description.replacingOccurrences(of: "\\n", with: "\n")
                descriptionDetail.text = description
                challenge.text = application.challenge
                
                frameworks = application.frameworks
            }
        }
    }
    
    override func awakeFromNib() {
        
        nameCell.font = UIFont.largeBold()
        companyCell.font = UIFont.normal()
        
        nameDetail.font = UIFont.largeBold()
        companyDetail.font = UIFont.normal()
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        
        frameworkCollection.delegate = self
        frameworkCollection.dataSource = self
        
        let layout = frameworkCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize.zero
        
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}

extension ProjectCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frameworks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as! FrameworkCell
        cell.name.font = UIFont.short()
        cell.name.textColor = .white
        cell.backgroundColor = .first()
        cell.layer.cornerRadius = 5.0
        cell.name.text = frameworks[indexPath.item]
        cell.name.sizeToFit()
        cell.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        return cell
    }
}

extension ProjectCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tagString = frameworks[indexPath.row] as NSString
        
        let fontAttributes = [NSFontAttributeName: UIFont.shortBold()]
        var size = tagString.size(attributes: fontAttributes)
        size.width += 16
        return size
    }
}
