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
    
    struct FeedBack {
        var rate : String
        var review : String
        var date : String
        
    }
    
    struct Request {
        var organizerName : String
        var partyDate : String
        var partyType : String
        
    }
    
    var requests : [Request] = [Request(organizerName: "GHADEER ASHOOR".localized, partyDate: "02/03/2022", partyType: "Birthday".localized)]
    
    var coustemrfeedback : [FeedBack] = [ FeedBack(rate: "4.3", review: "Honestly, the service was more than wonderful".localized, date: "20 APR") , FeedBack(rate: "4.0" , review: "Like pictures".localized, date: "16 APR") , FeedBack(rate: "3.6", review: "Honestly, the service was great".localized, date: "07 APR"), FeedBack(rate: "4.0", review: "I don't have anything to add, the service is very good".localized, date: "1 MAR")
    ]
    
    var organizerInfo : [Organizer] = [
        Organizer(img: UIImage(named: "store1"), name: "GHADEER ASHOOR".localized, rate: "4.2", overView: "Modern Events & Wedding Designer".localized, isSaved: true, isIncludePackage: true),
        Organizer(img: UIImage(named: "store2"), name: "Party in Box".localized, rate: "3.7", overView: "organizing parties for more than 10 years".localized, isSaved: false, isIncludePackage: false),
        Organizer(img: UIImage(named: "store3"), name: "Glowing Party".localized, rate: "4.0", overView: "organizing parties and offer packages with good prices".localized, isSaved: true, isIncludePackage: true),
        Organizer(img: UIImage(named: "store4"), name: "Luxury event".localized, rate: "4.3", overView: "offer packages with good prices".localized, isSaved: true, isIncludePackage: true)
    ]
    
    var orderInThepast : [Request] = [Request(organizerName: "Glowing Party".localized, partyDate: "02/03/2019", partyType: "Birthday".localized), Request(organizerName: "Party in Box".localized, partyDate: "02/08/2021", partyType: "Wedding".localized)]
    
    var filterData = [Organizer]()
    
    func filterSavedItems() {
        for i in organizerInfo {
            if i.isSaved == true {
                filterData.append(i)
            }
        }
    }
    
}

