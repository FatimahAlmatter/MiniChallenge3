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
    
    var organiazer = OrganizersModel()
    //
    var arrayCatalog = [UIImage(named: "1"), UIImage(named: "22"), UIImage(named: "33"), UIImage(named: "444"), UIImage(named: "5555")]
    var arrayPackage = [UIImage(named: "p1"), UIImage(named: "p2"), UIImage(named: "p3")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        feedback.delegate = self
        feedback.dataSource = self
        
        packageCollection.delegate = self
        packageCollection.dataSource = self

        
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
            cell2.layer.cornerRadius = 20
            cell2.comments.text = organiazer.coustemrfeedback[indexPath.row].review
            cell2.date.text = organiazer.coustemrfeedback[indexPath.row].date
            cell2.rate.text = organiazer.coustemrfeedback[indexPath.row].rate
            
            return cell2
        } else {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)  as! orgpackingCollectionViewCell
            cell3.layer.cornerRadius = 20
            cell3.imgPackage.image = arrayPackage[indexPath.row]
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
