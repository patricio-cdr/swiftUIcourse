//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Patricio Calderon on 30/05/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!

    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = myName
    }
    


}
