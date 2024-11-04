//
//  ViewController.swift
//  UsersLocationApp
//
//  Created by Nilüfer Altınoluk on 4.11.2024.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
                         [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation :CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        
        self.map.setRegion(region , animated: true)
        
        
        print(location.altitude)
        print(location.speed)
        print(" latitude: \(location.coordinate.latitude), longitude: \(location.coordinate.longitude)")
              
        self.map.showsUserLocation = true
              
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }


}

