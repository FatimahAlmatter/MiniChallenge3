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
    @IBOutlet weak var Segmentcontrol: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Collection.delegate = self
        Collection.dataSource = self
        
        
    }
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        Collection.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Segmentcontrol.selectedSegmentIndex{
        case 0:
            Segmentcontrol.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            return model.requests.count
        case 1:
            Segmentcontrol.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            return  model.orderInThepast.count
            
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RCollectionViewCell
        
        switch Segmentcontrol.selectedSegmentIndex {
        case 0:
            cell.layer.cornerRadius = 20
                
            cell.StoreName.text = model.requests[indexPath.row].organizerName
            
            cell.PkgDate.text = model.requests[indexPath.row].partyDate
            cell.PartyType.text = model.requests[indexPath.row].partyType
            
            return cell
        case 1:
            cell.layer.cornerRadius = 20
            
            cell.StoreName.text = model.orderInThepast[indexPath.row].organizerName
            
            cell.PkgDate.text = model.orderInThepast[indexPath.row].partyDate
            cell.PartyType.text = model.orderInThepast[indexPath.row].partyType
            cell.Paymentphoto.image = UIImage(named: "applePay")
            
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
    
    
    
}


