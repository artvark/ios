//
//  MapViewController.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/25/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    let mapView = MKMapView()
    var locationManager: CLLocationManager?
    
    init() {
        self.init()
        super.init(nibName:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Here")
        locationManager = CLLocationManager()
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = false
        
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager?.requestWhenInUseAuthorization()
        }
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        
    }
    
    func locationManager(_ manager
        : CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Callback")
        if (status == .authorizedWhenInUse) {
            manager.startUpdatingLocation();
        } else {
            print("Denied location services")
        }
    }
       
    func getLocationManger() -> CLLocationManager {
        return locationManager ?? CLLocationManager()
    }
        
    
    
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
////        let coordinate: CLLocationCoordinate2D = manager.location!.coordinate
//        
////        let coordinate = CLLocationCoordinate2D(
////             latitude: 34.011286, longitude: -116.166868)
////        print ("locations= \(coordinate.latitude) \(coordinate.longitude)")
////
////        mapView.mapType = MKMapType.standard
////
////        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta:0.02)
////        let region = MKCoordinateRegion(center: coordinate, span: span)
////        mapView.setRegion(region, animated: true)
//    }

}
