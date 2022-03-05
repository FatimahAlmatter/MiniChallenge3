//
//  RequestDetailsVC.swift
//  MiniChallenge3
//
//  Created by Fatimah Almatter on 21/02/2022.
//

import UIKit

class RequestDetailsVC: UIViewController {
    
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var menu: UITextField!
    @IBOutlet weak var labeln: UILabel!
    
    
    
    @IBOutlet weak var note: UITextView!
    let menu1 = ["wedding", "birthday", "Graduation", "Anniversary", "bridal-shower", "engagement", "Baby-shower", "Retirement"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Request"
        note.layer.cornerRadius = 12
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        menu.inputView = pickerView
        
        
    }
    
    @IBAction func confirmreq(_ sender: Any) {
        let alert = UIAlertController(title: "Pending...", message: "Your request is pending now, you will be notified once the organizer accept it", preferredStyle:.alert)
       //alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in
            self.performSegue(withIdentifier: "notificationScreen", sender: self)
            

        }))

        present(alert, animated: true) 
    }
    
    @IBAction func stepBtn(_ sender: UIStepper) {
        labeln.text = String(Int(sender.value))
        print(sender.value)
        
    }
    
}



extension RequestDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menu1.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menu1[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        menu.text = menu1[row]
        menu.resignFirstResponder()
        
    }
    
    
}
