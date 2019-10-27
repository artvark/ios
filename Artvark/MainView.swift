//
//  MainView.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/25/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    @ObservedObject var locationManager = LocationManager()
        
    var body: some View {

        ZStack{
            MapView(location: $locationManager.lastLocation)
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
