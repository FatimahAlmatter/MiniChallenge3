//
//  PackageCollectionViewCell.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 22/02/2022.
//

import UIKit

//
//  PackageCollectionViewCell.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 22/02/2022.
//


class PackageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeRate: UILabel!
    @IBOutlet weak var storeOverview: UILabel!
    @IBOutlet weak var SavedAction: UIButton!
    @IBOutlet weak var includePackageTag: UILabel!
    
        
    @IBAction func savedBtnPressed(_ sender: UIButton) {
        //if empty
        if SavedAction.tag == 0 {
            SavedAction.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            SavedAction.tag = 1
        
        } else {
            SavedAction.setImage(UIImage(systemName: "bookmark"), for: .normal)
            SavedAction.tag = 0
            
        }
    }
}
