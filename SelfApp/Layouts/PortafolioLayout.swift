//
//  PortafolioLayout.swift
//  SelfApp
//
//  Created by jorge luna on 13/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit

class PortafolioLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
        var leftMargin: CGFloat = 0.0
        for attributes in attributesForElementsInRect! {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width
            newAttributesForElementsInRect.append(attributes)
        }
        return newAttributesForElementsInRect
    }
}
