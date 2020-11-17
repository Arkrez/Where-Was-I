//
//  ViewController.swift
//  Where Was I
//
//  Created by Kira Rodriguez on 11/10/20.
//  Copyright © 2020 ArklightStudios. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBAction func savedButtonClick(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude {
            if let long = coord?.longitude {
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
                updatePin()
            }
        }

    }
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        updatePin()
    }
    
    func updatePin() {
        
        let annoRem = mapView.annotations.filter{$0 !== mapView.userLocation}
        mapView.removeAnnotations(annoRem)
        
        if let oldCoords = DataStore().GetLastLocation(){
            let annotation = MKPointAnnotation()
                
            
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            annotation.coordinate.longitude = Double(oldCoords.longitude)!
            
            annotation.title = "I was here!"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled")
            return
        }
        
        print("Location allowed")
        mapView.showsUserLocation = true
    }


}

