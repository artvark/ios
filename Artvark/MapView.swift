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
    @Binding var location: CLLocation
    
    var userLatitude: String {
        return "\(location.coordinate.latitude)"
    }

    var userLongitude: String {
        return "\(location.coordinate.longitude)"
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
        map.showsUserLocation = true
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        if (location != nil) {
            print("Updating Location")
            let coordinate: CLLocationCoordinate2D = location.coordinate
                   
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
//        MapView(locationManager: LocationManager())
//    }
//}

