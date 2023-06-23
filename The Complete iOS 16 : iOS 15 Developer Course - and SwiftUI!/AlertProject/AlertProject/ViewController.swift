//
//  ViewController.swift
//  AlertProject
//
//  Created by Patricio Calderon on 31/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPassword2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        /*
        let alert = UIAlertController(title: "Error!", message: "Username not found!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
            // button clicked
            print("button clicked")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        */
        if txtUsername.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Username not found")
        } else if txtPassword.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Password not found")
        } else if txtPassword2.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Passwords do not match")
        } else {
            makeAlert(titleInput: "Success", messageInput: "User OK")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}

