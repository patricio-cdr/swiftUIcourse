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
    }
    
}

