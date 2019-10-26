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
    var controller = MapViewController()
    
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) ->
        MKMapView {
            return controller.mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        if (controller.isViewLoaded == false) {
            return
        }
        
        while (controller.getLocationManger().location == nil) {
            print("sleep")
            sleep(1)
        }
        
        
        let coordinate: CLLocationCoordinate2D = controller.getLocationManger().location!.coordinate
        
        controller.mapView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta:0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        controller.mapView.setRegion(region, animated: true)
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

