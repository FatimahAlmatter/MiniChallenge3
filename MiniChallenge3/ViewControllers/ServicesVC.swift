//
//  ViewController.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class ServicesVC: UIViewController {
    
    @IBOutlet weak var adsCollection: UICollectionView!
    @IBOutlet weak var pageControlOutlet: UIPageControl!
    @IBOutlet weak var searchOutlet: UISearchBar!
    @IBOutlet weak var servicesCollection: UICollectionView!
    @IBOutlet weak var packagesCollection: UICollectionView!
    
    
    var adsArray = [UIImage(named: "ad1") , UIImage(named: "ad2")]
    var servicesArray = [UIImage(named: "Catering") , UIImage(named: "Decorations"), UIImage(named: "Gifts") , UIImage(named: "Dj"), UIImage(named: "invitation") , UIImage(named: "Wedding"), UIImage(named: "Security")]
    var services = ["Catering","Decorations","Gifts","Technical & DJ","invitation","Wedding", "Security"]
    var timer: Timer?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adsCollection.delegate = self
        adsCollection.dataSource = self
        adsCollection.layer.cornerRadius = 20
        pageControlOutlet.numberOfPages = adsArray.count
        startTimer()
        
        servicesCollection.delegate = self
        servicesCollection.dataSource = self
        
        packagesCollection.delegate = self
        packagesCollection.dataSource = self
        packagesCollection.layer.cornerRadius = 20

        
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
}

extension ServicesVC : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.adsCollection {
            return adsArray.count
        } else if collectionView == self.servicesCollection {
            return servicesArray.count
        } else {
            return 1
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
        return 0
        
    }
    
}



