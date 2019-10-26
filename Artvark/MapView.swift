//
//  MapView.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/25/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: UIViewRepresentable {
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    func makeUIView(context: Context) ->
        MKMapView {
            self.locationManager.startUpdating()
            return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        if (locationManager.location != nil) {
            print("here")
            let coordinate: CLLocationCoordinate2D = locationManager.location!.coordinate
                   
            view.mapType = MKMapType.standard
           
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta:0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
        }
       
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

