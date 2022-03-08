//
//  ServicesCollectionViewCell.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 22/02/2022.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var serviceImg: UIImageView!
    @IBOutlet weak var serviceName: UILabel!
    
    func configure(with item: ServicesVC.Service){
        self.serviceImg.image = UIImage(named: item.img)
        self.serviceName.text = item.lbl
        
        self.serviceImg.isAccessibilityElement = false
        self.serviceName.isAccessibilityElement = false
       
        isAccessibilityElement = true
        
        accessibilityLabel = "Image of the service is \(item.img) and name of service is \(item.lbl)"
        accessibilityHint = "Double Click to show all service providers"
        
        
    }
}
