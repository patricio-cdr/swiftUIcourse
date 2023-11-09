//
//  ButtonViewController.swift
//  LandmarkBook
//
//  Created by Patricio Calderon on 9/11/23.
//

import UIKit

class ButtonViewController: UIViewController {

    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnTapToInitialVC(_ sender: Any) {
        mainCoordinator?.startCoordinator()
    }
    
    @IBAction func btnTapToDetailsVC(_ sender: Any) {
        mainCoordinator?.showDetailsOf(landmarkName: "Test", landmarkImage: UIImage())
    }
    
}
