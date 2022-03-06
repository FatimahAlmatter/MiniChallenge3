//
//  SavedVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class SavedVC: UIViewController {
    var organizer = OrganizersModel()
    
    @IBOutlet weak var savedCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Saved Items".localized
        
        savedCollectionView.delegate = self
        savedCollectionView.dataSource = self
        
        let nib = UINib(nibName: "View", bundle: nil)
        savedCollectionView.register(nib, forCellWithReuseIdentifier: "packageCell")
        organizer.filterSavedItems()

    }
    
}

extension SavedVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return organizer.filterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackageCollectionViewCell
        cell3.layer.cornerRadius = 12
        cell3.storeImg.image = organizer.filterData[indexPath.row].img
        cell3.storeName.text = organizer.filterData[indexPath.row].name
        cell3.storeRate.text = organizer.filterData[indexPath.row].rate
        cell3.storeOverview.text = "Overview".localized + "\(organizer.filterData[indexPath.row].overView)"
        
        
        if organizer.filterData[indexPath.row].isSaved == true {
            cell3.SavedAction.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            cell3.SavedAction.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
        
        if organizer.filterData[indexPath.row].isIncludePackage == true {
            cell3.includePackageTag.isHidden = false
            cell3.includePackageTag.text = "include Package".localized

        } else {
            cell3.includePackageTag.isHidden = true
        }
        
        
        return cell3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 170)
        
    }
    
    
    
}
