//
//  ViewController.swift
//  TimerProject
//
//  Created by Patricio Calderon on 15/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblLabel: UILabel!
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        lblLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        
       
    }
    
    @objc func timerFunction(){
        lblLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            lblLabel.text = "Time's Over"
        }
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("button clicked")
    }
    
}

