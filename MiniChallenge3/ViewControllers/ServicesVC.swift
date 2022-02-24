//
//  ViewController.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class ServicesVC: UIViewController {
    var organizer = OrganizersModel()
    
    @IBOutlet weak var adsCollection: UICollectionView!
    @IBOutlet weak var pageControlOutlet: UIPageControl!
    @IBOutlet weak var servicesCollection: UICollectionView!
    @IBOutlet weak var packagesCollection: UICollectionView!
    
    let search = UISearchController()
    
    var adsArray = [UIImage(named: "ad3") , UIImage(named: "ad1"), UIImage(named: "ad2")]
    var servicesArray = [UIImage(named: "Catering") , UIImage(named: "Decorations"), UIImage(named: "Gifts") , UIImage(named: "Dj"), UIImage(named: "invitation") , UIImage(named: "Wedding"), UIImage(named: "Security")]
    var services = ["Catering","Decorations","Gifts","Technical & DJ","invitation","Wedding", "Security"]
    var timer: Timer?
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        adsCollection.delegate = self
        adsCollection.dataSource = self
        adsCollection.layer.cornerRadius = 20
        pageControlOutlet.numberOfPages = adsArray.count
        startTimer()
        
        servicesCollection.delegate = self
        servicesCollection.dataSource = self
        
        packagesCollection.delegate = self
        packagesCollection.dataSource = self
        
        let nib = UINib(nibName: "View", bundle: nil)
        packagesCollection.register(nib, forCellWithReuseIdentifier: "packageCell")
        
        
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex(){
        if currentIndex < adsArray.count - 1 {
            currentIndex += 1
            
        } else {
            currentIndex = 0
        }
        adsCollection.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControlOutlet.currentPage = currentIndex
        
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = search.searchBar.text else {
//            return
//        }
//        search.searchResultsController
//    }
}




extension ServicesVC : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.adsCollection {
            return adsArray.count
        } else if collectionView == self.servicesCollection {
            return servicesArray.count
        } else {
            return organizer.organizerInfo.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.adsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCell", for: indexPath) as! AdsCollectionViewCell
            cell.adsImg.image = adsArray[indexPath.row]
            return cell
        } else if collectionView == self.servicesCollection {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServicesCollectionViewCell
            cell2.serviceImg.image = servicesArray[indexPath.row]
            cell2.serviceName.text = services[indexPath.row]
            return cell2
        } else {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackageCollectionViewCell
            
            cell3.layer.cornerRadius = 12
            cell3.storeImg.image = organizer.organizerInfo[indexPath.row].img
            cell3.storeName.text = organizer.organizerInfo[indexPath.row].name
            cell3.storeRate.text = organizer.organizerInfo[indexPath.row].rate
            cell3.storeOverview.text = organizer.organizerInfo[indexPath.row].overView
            
            if organizer.organizerInfo[indexPath.row].isSaved == true {
                cell3.SavedAction.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else {
                cell3.SavedAction.setImage(UIImage(systemName: "bookmark"), for: .normal)
                
            }
            
            if organizer.organizerInfo[indexPath.row].isIncludePackage == true {
                cell3.includePackageTag.isHidden = false
            } else {
                cell3.includePackageTag.isHidden = true
            }
            
            return cell3
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.adsCollection {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else if collectionView == self.servicesCollection {
            return CGSize(width: 170, height: collectionView.frame.height)
            
        } else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.packagesCollection {
            return 20
        } else {
            return 1
            
            
        }
        
        
    }
    
}




