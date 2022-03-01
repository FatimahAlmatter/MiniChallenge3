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
    
  override func viewDidLoad() {
    super.viewDidLoad()
    PckgDetails.delegate = self
    PckgDetails.dataSource = self
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
