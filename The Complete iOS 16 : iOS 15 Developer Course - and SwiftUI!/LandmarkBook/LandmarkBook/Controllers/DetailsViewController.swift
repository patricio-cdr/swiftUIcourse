//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Patricio Calderon on 23/06/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    weak var mainCoordinator: MainCoordinator?

    @IBOutlet weak var lblLandmark: UILabel!
    @IBOutlet weak var imvLandmark: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblLandmark.text = selectedLandmarkName
        imvLandmark.image = selectedLandmarkImage
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imvLandmark.isUserInteractionEnabled = true
        imvLandmark.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageViewTapped() {
        print("tapped")
        mainCoordinator?.showButton()
    }

}
