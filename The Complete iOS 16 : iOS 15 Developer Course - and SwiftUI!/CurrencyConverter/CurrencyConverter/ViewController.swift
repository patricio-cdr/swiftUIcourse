//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Patricio Calderon on 23/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCAD: UILabel!
    @IBOutlet weak var lblCHF: UILabel!
    @IBOutlet weak var lblGBP: UILabel!
    @IBOutlet weak var lblJPY: UILabel!
    @IBOutlet weak var lblUSD: UILabel!
    @IBOutlet weak var lblTRY: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        // This are the steps we need to follow in order to consume data from an API
        // 1) Request & Session
        // 2) Response & Data
        // 3) Parsing & JSON Serialization
        
        
        // 1) Request & Session
        if let url = URL(string: "http://data.fixer.io/api/latest?access_key=f9a7c915459a471887f55345ac7a57e7") {
            
            let session = URLSession.shared
            // This is a closure
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    
                    // Since we are in a closure, in order to present the alert we need to refer to self
                    self.present(alert, animated: true, completion: nil)
                } else {
                    
                    // 2) Response & Data
                    if let responseData = data {
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableContainers)
                            
                            // ASYNC
                            DispatchQueue.main.async {
                                print(jsonResponse)
                            }
                            
                        } catch {
                            print("Error")
                        }
                        
                    }
                }
            }
            task.resume()
        }
        
        
        // 2) Response & Data
        // 3) Parsing & JSON Serialization
        
        
        
    }
    
}

