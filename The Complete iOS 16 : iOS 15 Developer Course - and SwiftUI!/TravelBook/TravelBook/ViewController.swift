//
//  ViewController.swift
//  TravelBook
//
//  Created by Patricio Calderon on 8/08/23.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var txtNote: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedId : UUID?
    
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManagerDidChangeAuthorization(locationManager)
        
        // Recognizers
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        
        let hideKeyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardRecognizer)
        
        if selectedTitle != "" {
            // CoreData
            let stringUUID = selectedId?.uuidString
            print(stringUUID)
        } else {
            // Add new data
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = touchCoordinates.latitude
            chosenLongitude = touchCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchCoordinates
            annotation.title = nameTextField.text
            annotation.subtitle = txtNote.text
            self.mapView.addAnnotation(annotation)
            
        }
    }
    
    

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                enableLocationFeatures()
                break

            case .restricted, .denied:  // Location services currently unavailable.
                //disableLocationFeatures()
                break

            case .notDetermined:        // Authorization not determined yet.
                manager.requestWhenInUseAuthorization()
                break

            default:
                break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: currentLocation, span: span)
            mapView.setRegion(region, animated: true)
            
        }
        
    }

    func enableLocationFeatures() {
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameTextField.text, forKey: "title")
        newPlace.setValue(txtNote.text, forKey: "subTitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("success")
        } catch {
            print("error")
        }
        
    }
    
}



