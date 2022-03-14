//
//  ProfileTableVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 06/03/2022.
//

import UIKit

class ProfileTableVC: UITableViewController {
    
    @IBOutlet weak var logout: UIBarButtonItem!
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(UINib(nibName: "StaticProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        tableview.register(UINib(nibName: "CellForLang", bundle: nil), forCellReuseIdentifier: "LangCell")
        
        
        logout.title = "Logout".localized
        title = "Profile".localized
        
        
    }
    
    @objc func changeLang(_ sender: UISegmentedControl) {
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
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        if indexPath.row == 0 {
            cell.lbl.text = "Messages".localized
            return cell
        } else if indexPath.row == 1 {
            cell.lbl.text = "Payment Method".localized
            return cell
        } else {
            let cell2 = tableview.dequeueReusableCell(withIdentifier: "LangCell", for: indexPath) as! LanguageCell
            cell2.lbl.text = "Language".localized
            cell2.segmented.addTarget(self, action: #selector(changeLang), for: .valueChanged)
            
            let currentLang = Locale.current.languageCode
            
            if currentLang == "en" {
                cell2.segmented.selectedSegmentIndex = 0
            } else {
                cell2.segmented.selectedSegmentIndex = 1
                
            }
            
            
            return cell2
            
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
