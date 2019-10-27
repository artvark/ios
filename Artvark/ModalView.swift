//
//  ModalView.swift
//  Artvark
//
//  Created by Luis Gonzalez on 10/26/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import Foundation
import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
            VStack{
                Button(action: {
                    print("dismisses form")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss")
                }
                MapView(location: $locationManager.lastLocation)
            }
        
       
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}