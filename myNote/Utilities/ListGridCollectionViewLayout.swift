//
//  ListGridCollectionViewLayout.swift
//  appNotes
//
//  Created by Mohan K on 04/03/23.
//

import Foundation
import UIKit

class  ListGridCollectionViewLayout: UICollectionViewFlowLayout{

    var isGrid = false
    override func prepare() {
        super.prepare()
        
        if let collectionView = collectionView {
            let bounds = collectionView.bounds
            let width = bounds.width - sectionInset.left - sectionInset.right
            let height = itemSize.height + minimumLineSpacing
            
            if isGrid {
                let columns: CGFloat = 2
                let spacing = minimumInteritemSpacing * (columns - 1)
                let itemWidth = (width - spacing) / columns
                itemSize = CGSize(width: itemWidth, height: itemSize.height)
                minimumLineSpacing = minimumInteritemSpacing
            } else {
                itemSize = CGSize(width: width, height: itemSize.height)
                minimumLineSpacing = height
            }
        }
    }
      
   }

