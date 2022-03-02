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
    
    var organizer = OrganizersModel()
    
    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeRate: UILabel!
    @IBOutlet weak var storeOverview: UILabel!
    @IBOutlet weak var SavedAction: UIButton!
    @IBOutlet weak var includePackageTag: UILabel!
    
    
    @IBAction func savedBtnPressed(_ sender: UIButton) {
        //if empty
            if sender.tag == 0 {
                print("before: \(sender.tag)")
                sender.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
                sender.tag = 1
                print("after: \(sender.tag)")
                
            } else {
                print("before: \(sender.tag)")
                sender.setImage(UIImage(systemName: "bookmark"), for: .normal)
                sender.tag = 0
                print("after: \(sender.tag)")

            }


    }
}
