//
//  ServiceProvidersVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class ServiceProvidersVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    var vc = OrganizersModel()
    
    
    
    @IBOutlet weak var collectionv: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionv.delegate = self
        collectionv.dataSource = self
        
        let nib = UINib(nibName: "View", bundle: nil)
        collectionv.register(nib, forCellWithReuseIdentifier: "packageCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "requestScreen", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vc.organizerInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackageCollectionViewCell
        cell3.layer.cornerRadius = 12
        cell3.configure(with: vc.organizerInfo[indexPath.row])
        cell3.storeImg.image = UIImage(named: vc.organizerInfo[indexPath.row].img)
        cell3.storeName.text = vc.organizerInfo[indexPath.row].name
        cell3.storeRate.text = vc.organizerInfo[indexPath.row].rate
        cell3.storeOverview.text = "Overview".localized + ": \(vc.organizerInfo[indexPath.row].overView) "
        
        if vc.organizerInfo[indexPath.row].isSaved == true {
            cell3.SavedAction.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            cell3.SavedAction.setImage(UIImage(systemName: "bookmark"), for: .normal)
            
        }
        
        if vc.organizerInfo[indexPath.row].isIncludePackage == true {
            cell3.includePackageTag.isHidden = false
            cell3.includePackageTag.text = "include Package".localized

        } else {
            cell3.includePackageTag.isHidden = true
        }
        
        return cell3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 161)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
        
        
    }
}
