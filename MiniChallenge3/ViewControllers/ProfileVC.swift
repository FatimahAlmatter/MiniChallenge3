//
//  ProfileVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class ProfileVC: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeLang(_ sender: UISegmentedControl) {
        let alert = UIAlertController(title: "change language", message: "need to re-start app", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
            exit(0)
        }))
        let currentLang = Locale.current.languageCode
        print(currentLang)
        let newLang = currentLang == "en" ? "ar" : "en"
        if sender.selectedSegmentIndex == 0 {
            UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
        } else {
            UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
        }
    }
    
    

}
