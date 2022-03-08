//
//  feedbackCollectionViewCell.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 28/02/2022.
//

import UIKit

class feedbackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func feedbackaccessbility (with item: OrganizersModel.FeedBack){
        self.rate.text = item.rate
        self.comments.text = item.review
        self.rate.isAccessibilityElement = false
        self.comments.isAccessibilityElement = false
        isAccessibilityElement = true
        accessibilityLabel = "the rate of this comment is 22 \(item.rate)"
        accessibilityLabel = "the  comment of this rate is \(item.review)"

        


    }}
