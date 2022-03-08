//
//  orgpackingCollectionViewCell.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 28/02/2022.
//

import UIKit

class orgpackingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgPackage: UIImageView!
    
    func orgaccessbility (with item: String){
        self.imgPackage.image =  UIImage(named: item)  //UIImage(named: )
        self.imgPackage.isAccessibilityElement = false
        isAccessibilityElement = true
        accessibilityLabel = "this package is\(item)"
        accessibilityHint = "double tap to get more info "
    }
    
}
