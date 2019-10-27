//
//  MainView.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/25/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {

        ZStack{
            //MapViewRepresentable(location: $locationManager.lastLocation)
            MapViewRepresentable()
        }
        
    }
    
}

struct MapViewRepresentable: UIViewRepresentable {
//    @Binding var location: CLLocation
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapViewRepresentable

        init(_ control: MapViewRepresentable) {
            self.control = control
        }
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.showsCompass = true
        
        let button = MKUserTrackingButton(mapView: map)
        button.layer.backgroundColor = UIColor(white: 1, alpha: 1).cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        map.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: map.layoutMarginsGuide.topAnchor, constant: 45),
            button.trailingAnchor.constraint(equalTo: map.layoutMarginsGuide.trailingAnchor, constant: -3),
        ])
        
        map.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: true)
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: true)
       
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
