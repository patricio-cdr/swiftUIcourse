//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Patricio Calderon on 23/06/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblLandmark: UILabel!
    @IBOutlet weak var imvLandmark: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblLandmark.text = selectedLandmarkName
        imvLandmark.image = selectedLandmarkImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
