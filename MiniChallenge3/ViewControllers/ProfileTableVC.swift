//
//  ProfileTableVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 06/03/2022.
//

import UIKit

class ProfileTableVC: UITableViewController {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentLang = Locale.current.languageCode

        if currentLang == "en" {
            segmented.selectedSegmentIndex = 0
        } else {
            segmented.selectedSegmentIndex = 1

            
        }
        
    }
    
    @IBAction func changeLang(_ sender: UISegmentedControl) {
        let alert = UIAlertController(title: "change language", message: "need to re-start app", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
            exit(0)
        }))
        present(alert, animated: true)
        {
            let currentLang = Locale.current.languageCode
            let newLang = currentLang == "en" ? "ar" : "en"
            UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
            
        }
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
    }
}
