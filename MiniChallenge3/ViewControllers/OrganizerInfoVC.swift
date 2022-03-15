//
//  OrganizerInfoViewController.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//


import UIKit

class OrganizerInfoVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var packageCollection: UICollectionView!
    @IBOutlet weak var feedback: UICollectionView!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var storeLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var packagesLbl: UILabel!
    @IBOutlet weak var catalogLbl: UILabel!
    @IBOutlet weak var feedbacksLbl: UILabel!
    @IBOutlet weak var moreLBL: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var organiazer = OrganizersModel()
    //
    var arrayCatalog = [UIImage(named: "1"), UIImage(named: "22"), UIImage(named: "33"), UIImage(named: "444"), UIImage(named: "5555")]
    var arrayPackage = [ "Birthday  Package", "Graduation Package", "Wedding  Package"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeLbl.text = "GHADEER ASHOOR".localized
        overviewLbl.text = "Overview".localized
        packagesLbl.text = "Packages".localized
        catalogLbl.text = "Catalog".localized
        feedbacksLbl.text = "feedback".localized
        moreLBL.titleLabel?.text = "more".localized
        descriptionLbl.text = "Modern Events & Wedding Designer".localized
        
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        feedback.delegate = self
        feedback.dataSource = self
        
        packageCollection.delegate = self
        packageCollection.dataSource = self

        
    }
    
    @IBAction func requestBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "request", sender: self)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.packageCollection {
            performSegue(withIdentifier: "requestPackage", sender: self)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionview {
            
            return arrayCatalog.count
        } else if collectionView == self.feedback {
            return organiazer.coustemrfeedback.count
        } else {
            return arrayPackage.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)  as! CatagoryCollectionViewCell
            cell.layer.cornerRadius = 20
            cell.catagory.image = arrayCatalog[indexPath.row]
            return cell
        } else if collectionView == self.feedback {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! feedbackCollectionViewCell
            
            cell2.feedbackaccessbility(with: organiazer.coustemrfeedback[indexPath.row])

            cell2.layer.cornerRadius = 20
            cell2.comments.text = organiazer.coustemrfeedback[indexPath.row].review
            cell2.date.text = organiazer.coustemrfeedback[indexPath.row].date
            cell2.rate.text = organiazer.coustemrfeedback[indexPath.row].rate
            cell2.reviewLabel.text = "Review".localized

            
            return cell2
        } else {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)  as! orgpackingCollectionViewCell
            cell3.orgaccessbility(with: self.arrayPackage[indexPath.row])
            cell3.layer.cornerRadius = 20
            cell3.imgPackage.image = UIImage(named: arrayPackage[indexPath.row])
            
            return cell3
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.feedback {
            return CGSize(width: collectionView.frame.width, height: 129)
        } else {
            return CGSize(width: 140, height: 116)
            
        }
    }

}
