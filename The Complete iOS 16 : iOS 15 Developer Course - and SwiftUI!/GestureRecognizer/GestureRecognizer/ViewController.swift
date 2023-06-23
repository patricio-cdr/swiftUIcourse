//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Patricio Calderon on 15/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var isDef1 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imgView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changePic() {
            
        if isDef1 == true {
            imgView.image = UIImage(named: "deftones2")
            lblLabel.text = "deftones2"
            isDef1 = false
        } else {
            imgView.image = UIImage(named: "deftones1")
            lblLabel.text = "deftones1"
            isDef1 = true
        }
        
    }

}

