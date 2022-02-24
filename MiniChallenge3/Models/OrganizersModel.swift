//
//  OrganizersModel.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 23/02/2022.
//

import Foundation
import UIKit

class OrganizersModel {
    
struct Organizer {
    var img : UIImage?
    var name : String
    var rate : String
    var overView : String
    var isSaved : Bool
    var isIncludePackage : Bool
  //  var feedback : FeedBack
    
}

//struct FeedBack {
//    var rate : String
//    var review : String
//    var date : String
//
//}

var organizerInfo : [Organizer] = [
    Organizer(img: UIImage(named: "store1"), name: "GHADEER ASHOOR", rate: "4.2", overView: "Modern Events & Wedding Designer. ", isSaved: true, isIncludePackage: true),
    Organizer(img: UIImage(named: "store2"), name: "Party in Box", rate: "3.7", overView: "organizing parties for more than 10 years", isSaved: false, isIncludePackage: false),
    Organizer(img: UIImage(named: "store3"), name: "Glowing Party", rate: "4.0", overView: "organizing parties and offer packages with good prices", isSaved: true, isIncludePackage: true),
    Organizer(img: UIImage(named: "store4"), name: "Luxury event", rate: "4.3", overView: "organizing parties and offer packages with good prices", isSaved: true, isIncludePackage: true)
]
    
    var filterData = [Organizer]()

    func filterSavedItems() {
        for i in organizerInfo {
            if i.isSaved == true {
                filterData.append(i)
            }
        }
    }
    
}

