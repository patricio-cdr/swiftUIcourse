//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Patricio Calderon on 23/06/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    weak var mainCoordinator: MainCoordinator?
    
    var landmarkNames = [String]()
    var landmarksImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        
       
        landmarkNames.append("Colisseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Machu Pichu")
        
        
        landmarksImages.append(UIImage(named: "coliseo")!)
        landmarksImages.append(UIImage(named: "greatwall")!)
        landmarksImages.append(UIImage(named: "kremlin")!)
        landmarksImages.append(UIImage(named: "stonehenge")!)
        landmarksImages.append(UIImage(named: "machupichu")!)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = UITableViewCell()
       var content = cell.defaultContentConfiguration()
       content.text = landmarkNames[indexPath.row]
       content.secondaryText = ""
       cell.contentConfiguration = content
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarksImages[indexPath.row]
        
        mainCoordinator?.showDetailsOf(landmarkName: chosenLandmarkName, landmarkImage: chosenLandmarkImage)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarksImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}

