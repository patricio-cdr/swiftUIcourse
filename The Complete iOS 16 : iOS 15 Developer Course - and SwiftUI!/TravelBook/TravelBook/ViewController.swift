//
//  ViewController.swift
//  TravelBook
//
//  Created by Patricio Calderon on 8/08/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManagerDidChangeAuthorization(locationManager)
        
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
}



