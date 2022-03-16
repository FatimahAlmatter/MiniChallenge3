//
//  PackageDetailsViewController.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit


class PackageDetailsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var PckgDetails: UICollectionView!
    var arrpackgeCatalog = [UIImage(named: "pkg1"), UIImage(named: "pkg2"), UIImage(named: "pkg3")]
    @IBOutlet weak var catalogLbl: UILabel!
    @IBOutlet weak var chooseLbl: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var packIncludeLbl: UILabel!
    @IBOutlet weak var descriptionOfPckge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Package Details".localized

        catalogLbl.text = "Catalog".localized
        chooseLbl.text = "chooseDate".localized
        priceLbl.text = "price".localized
        packIncludeLbl.text = "Include".localized
        descriptionOfPckge.text = "packageDes".localized
        
        let attributedTitle = NSAttributedString(string: "confirm".localized)
        confirmBtn.setAttributedTitle(attributedTitle, for: .selected)
        confirmBtn.setAttributedTitle(attributedTitle, for: .normal)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        PckgDetails.delegate = self
        PckgDetails.dataSource = self
    }
    
    @IBAction func confirmbutton(_ sender: Any) {
        let alert = UIAlertController(title: "Pending".localized, message: "Your request is pending now, you will be notified once the organizer accept it".localized, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Ok".localized, style: .default, handler: { alert in
            self.performSegue(withIdentifier: "notificationScreen", sender: self)
        }))
        
        
        present(alert, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrpackgeCatalog.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellP", for: indexPath) as! PackageDetailsCollectionViewCell
        cell.imgCatalog.image = arrpackgeCatalog[indexPath.row]
        cell.layer.cornerRadius = 20
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: collectionView.frame.height)
    }
}
