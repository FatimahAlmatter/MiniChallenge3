//
//  ViewController.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class ServicesVC: UIViewController, CALayerDelegate {
    var organizer = OrganizersModel()
    
    @IBOutlet weak var adsCollection: UICollectionView!
    @IBOutlet weak var pageControlOutlet: UIPageControl!
    @IBOutlet weak var servicesCollection: UICollectionView!
    @IBOutlet weak var packagesCollection: UICollectionView!
    @IBOutlet weak var filtersBtnsCollection: UICollectionView!
    @IBOutlet weak var serviceLbl: UILabel!
    @IBOutlet weak var packLbl: UILabel!
    
    let search = UISearchController()
    
    struct Service {
        var img : String
        var lbl : String
    }
    
    
    var adsArray = [UIImage(named: "ad3") , UIImage(named: "ad1"), UIImage(named: "ad2"), UIImage(named: "ad4"), UIImage(named: "ad5")]
    
    var servicesArray = [Service(img: "Catering", lbl: "Catering".localized) , Service(img: "Decorations", lbl: "Decorations".localized), Service(img: "Gifts", lbl: "Gifts".localized) , Service(img: "Dj", lbl: "Technical & DJ".localized), Service(img: "invitation", lbl: "invitation".localized) , Service(img: "Security", lbl: "Security".localized) ]
    
    var catagories = ["All".localized,"Birthday".localized,"Graduation".localized,"Wedding".localized,"Anniversary".localized,"bridal-shower".localized,"engagement".localized,"Baby-shower".localized,"Retirement".localized]
    
    var timer: Timer?
    var currentIndex = 0
    let currentLang = Locale.current.languageCode

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentLang == "en" {
            servicesCollection.semanticContentAttribute = .forceLeftToRight
            filtersBtnsCollection.semanticContentAttribute = .forceLeftToRight
        } else {
            servicesCollection.semanticContentAttribute = .forceRightToLeft
            filtersBtnsCollection.semanticContentAttribute = .forceRightToLeft

            
            
        }
        
        serviceLbl.text = "Services".localized
        packLbl.text = "Packages".localized
        tabBarItem.title = "Services".localized
        
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
        pageControlOutlet.frame.size.height = 500
        
        let nib = UINib(nibName: "View", bundle: nil)
        packagesCollection.register(nib, forCellWithReuseIdentifier: "packageCell")
        
        filtersBtnsCollection.delegate = self
        filtersBtnsCollection.dataSource = self
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.filtersBtnsCollection.collectionViewLayout = layout
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "serviceProvidersScreen" {
            let VC = segue.destination as? ServiceProvidersVC
            VC?.title = "Catering".localized
            VC?.navigationItem.largeTitleDisplayMode = .never
            
            
            
        } else if segue.identifier == "goToOrganizerScreen" {
            let VC = segue.destination as? OrganizerInfoVC
            VC?.title = "Organizer Info".localized
            VC?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bubble.right.fill"), style: .plain, target: nil, action: nil)
            VC?.navigationItem.largeTitleDisplayMode = .never
            
        }
    }
    
    @IBAction func notificationPressed(_ sender: Any) {
        performSegue(withIdentifier: "notificationScreen", sender: nil)
        
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

extension ServicesVC : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.adsCollection {
            return adsArray.count
        } else if collectionView == self.servicesCollection {
            return servicesArray.count
        } else if collectionView == self.packagesCollection {
            return organizer.organizerInfo.count
        } else {
            return catagories.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.adsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdsCell", for: indexPath) as! AdsCollectionViewCell
            cell.adsImg.image = adsArray[indexPath.row]
            return cell
        } else if collectionView == self.servicesCollection {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServicesCollectionViewCell
            cell2.configure(with: self.servicesArray[indexPath.row])
            cell2.serviceImg.image = UIImage(named: servicesArray[indexPath.row].img)
            cell2.serviceName.text = servicesArray[indexPath.row].lbl
            return cell2
            
        } else if collectionView == self.packagesCollection  {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackageCollectionViewCell
            cell3.configure(with: organizer.organizerInfo[indexPath.row])
            cell3.layer.cornerRadius = 12
            cell3.storeImg.image = UIImage(named: organizer.organizerInfo[indexPath.row].img)
            cell3.storeName.text = organizer.organizerInfo[indexPath.row].name
            cell3.storeRate.text = organizer.organizerInfo[indexPath.row].rate
            cell3.storeOverview.text = "Overview".localized + ": \(organizer.organizerInfo[indexPath.row].overView)"
            
            if organizer.organizerInfo[indexPath.row].isSaved == true {
                cell3.SavedAction.tag = 1
                cell3.SavedAction.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else {
                cell3.SavedAction.tag = 0
                cell3.SavedAction.setImage(UIImage(systemName: "bookmark"), for: .normal)
                
            }
            
            if organizer.organizerInfo[indexPath.row].isIncludePackage == true {
                cell3.includePackageTag.isHidden = false
                cell3.includePackageTag.text = "include Package".localized
                
            } else {
                cell3.includePackageTag.isHidden = true
            }
            
            
            return cell3
            
        } else {
            let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "catagoiesCell", for: indexPath) as! ButtonsFilterCollectionViewCell
            cell4.filterBtn.setTitle(catagories[indexPath.row], for: .normal)
            cell4.filterBtn.translatesAutoresizingMaskIntoConstraints = false
            //the following code is to change the button size depends on text lenght
            let desiredButtonSize = CGSize(width: cell4.filterBtn.intrinsicContentSize.width, height: collectionView.frame.height)
            cell4.filterBtn.frame.size = desiredButtonSize
            
            
            
            if indexPath.row == 0 {
                cell4.layer.cornerRadius = 23
                cell4.contentView.backgroundColor = UIColor(named: "AppColor")
                cell4.filterBtn.titleLabel?.textColor = .white
            } else {
                cell4.layer.cornerRadius = 23
                cell4.contentView.backgroundColor = UIColor(named: "Color1")
                cell4.filterBtn.titleLabel?.textColor = .black
                
                
            }
            
            
            //            cell4.filterBtn.tag = indexPath.row
            //            cell4.filterBtn.addTarget(self, action: #selector(buttonFilter), for: .touchUpInside)
            
            return cell4
        }
        
        
    }
    
    //    @objc func buttonFilter(sender: UIButton){
    //        let indexpath1 = IndexPath(row: sender.tag, section: 0)
    //        if indexpath1.row == 0 {
    //            sender.backgroundColor = .purple
    //        } else {
    //            sender.backgroundColor = .red
    //
    //        }
    //
    //    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.servicesCollection {
            if indexPath.row == 0 {
                performSegue(withIdentifier: "serviceProvidersScreen", sender: self)
            }
            
        } else if collectionView == self.packagesCollection {
            if indexPath.row == 0 {
                performSegue(withIdentifier: "goToOrganizerScreen", sender: self)
            }
            
        } else if collectionView == self.filtersBtnsCollection {
            //TODO
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.adsCollection {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            
        } else if collectionView == self.servicesCollection {
            return CGSize(width: 170, height: collectionView.frame.height)
            
        } else if collectionView == self.packagesCollection{
            return CGSize(width: collectionView.frame.width  , height: 170)
            
        } else {
            return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.packagesCollection {
            return 20
        } else if collectionView == self.filtersBtnsCollection {
            return 10
        } else {
            return 6
        }
    }
    
    
}


