//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Patricio Calderon on 24/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblDeftones: UILabel!
    @IBOutlet weak var imvDeftones: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeClicked(_ sender: Any) {
        imvDeftones.image = UIImage(named: "deftones1")
    }
    
}

