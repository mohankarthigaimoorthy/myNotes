//
//  noteCollectionViewCell.swift
//  myNote
//
//  Created by Mohan K on 20/03/23.
//

import Foundation
import UIKit

class noteCollectionViewCell : UICollectionViewCell {
  
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//                self.layer.cornerRadius = self.layer.frame.size.width / 2
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.layer.frame.size.width / 2
//        self.layer.cornerRadius = (self.frame.height / 2)
//        self.layer.cornerRadius = 10
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
        //        self.layer.cornerRadius = self.layer.frame.size.width / 2

//        self.layer.cornerRadius = self.layer.frame.size.height / 2
//        self.clipsToBounds = false
    }

    override func prepareForReuse() {
//        self.layer.cornerRadius = self.layer.frame.size.width / 2
    }
    
    override class func awakeFromNib() {
        
    }
}
