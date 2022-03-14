//
//  MainScreen.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 08/03/2022.
//

import UIKit
//test
class MainScreen: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let items = tabBar.items else { return }

        items[0].title = "Services".localized
        items[1].title = "Requests".localized
        items[2].title = "Saved".localized
        items[3].title = "Profile".localized
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
