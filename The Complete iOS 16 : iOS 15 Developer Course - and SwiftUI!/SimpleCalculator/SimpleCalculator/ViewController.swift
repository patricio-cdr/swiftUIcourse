//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Patricio Calderon on 24/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtFirstNumber: UITextField!
    @IBOutlet weak var txtSecondNumber: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumClicked(_ sender: Any) {
        if let firstNumber = Int(txtFirstNumber.text!){
            if let secondNumber = Int(txtSecondNumber.text!){
                result = firstNumber + secondNumber
                lblResult.text = String(result)
            }
        }
        
    }
    
    @IBAction func subtractClicked(_ sender: Any) {
        if let firstNumber = Int(txtFirstNumber.text!){
            if let secondNumber = Int(txtSecondNumber.text!){
                result = firstNumber - secondNumber
                lblResult.text = String(result)
            }
        }
    }
    @IBAction func multiplicationClicked(_ sender: Any) {
        if let firstNumber = Int(txtFirstNumber.text!){
            if let secondNumber = Int(txtSecondNumber.text!){
                result = firstNumber * secondNumber
                lblResult.text = String(result)
            }
        }
    }
    @IBAction func divisionClicked(_ sender: Any) {
        if let firstNumber = Int(txtFirstNumber.text!){
            if let secondNumber = Int(txtSecondNumber.text!){
                result = firstNumber / secondNumber
                lblResult.text = String(result)
            }
        }
    }
    
    
}

