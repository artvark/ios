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
    @ObservedObject var locationManager: LocationManager
    
    var userLatitude: String {
        return "\(locationManager.lastLocation.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation.coordinate.longitude ?? 0)"
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        if (locationManager.lastLocation != nil) {
            print("Updating Location")
            let coordinate: CLLocationCoordinate2D = locationManager.lastLocation.coordinate
                   
            view.mapType = MKMapType.standard
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta:0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
        } else {
            print("No Location")
        }
       
    }
    
    
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}

