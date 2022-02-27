//
//  RequestsVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class RequestsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    var model = OrganizersModel()
    
    @IBOutlet weak var Collection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Collection.delegate = self
        
        Collection.dataSource = self
        
 
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.requests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RCollectionViewCell
        cell.layer.cornerRadius = 20
        
        cell.StoreName.text = model.requests[indexPath.row].organizerName
        
        cell.PkgDate.text = model.requests[indexPath.row].partyDate
        cell.PartyType.text = model.requests[indexPath.row].partyType

        return cell
        
        
    }


    
}

//    struct PKGD{
//        Let photo = UIImage
//        let storeName = String
//        let date = Int
//
//    }
