//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Patricio Calderon on 10/07/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsonArray = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        // Simpson objects
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "homer")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "House wife", simpsonImage: UIImage(named: "marge")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "bart")!)
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
        let abraham = Simpson(simpsonName: "Abraham Simpson", simpsonJob: "Veteran", simpsonImage: UIImage(named: "abraham")!)
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpsonArray.append(homer)
        mySimpsonArray.append(marge)
        mySimpsonArray.append(bart)
        mySimpsonArray.append(lisa)
        mySimpsonArray.append(abraham)
        mySimpsonArray.append(maggie)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = mySimpsonArray[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsonArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    
}

