//
//  NotificationsVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 26/02/2022.
//

import UIKit

class NotificationsVC: UIViewController {

    var model = OrganizersModel()
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notifications"
        
        collection.delegate = self
        collection.dataSource = self
    }
    

}

extension NotificationsVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.requests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paymentCell", for: indexPath) as! NotificationCell
        cell.layer.cornerRadius = 12
        cell.organizerName.text = "Organizer name: \(model.requests[indexPath.row].organizerName)"
        cell.partyDate.text = "Party date: \(model.requests[indexPath.row].partyDate)"
        cell.partyType.text = "Party type: \(model.requests[indexPath.row].partyType)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 186)
    }
    
    
    
}


