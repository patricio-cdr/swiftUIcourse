//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Patricio Calderon on 30/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting - as? vs as!
        if let newName = storedName as? String {
            lblName.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            lblBirthday.text = "Birthday: \(newBirthday)"
        }
        
        
        
    }
     
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if storedName is String {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        if storedBirthday is String {
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(txtName.text!, forKey: "name")
        UserDefaults.standard.set(txtBirthday.text!, forKey: "birthday")
        
        lblName.text = "Name: \(txtName.text!)"
        lblBirthday.text = "Birthday: \(txtBirthday.text!)"
    }
    

}

