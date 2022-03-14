//
//  LanguageCell.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 13/03/2022.
//

import UIKit

class LanguageCell: UITableViewCell {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
