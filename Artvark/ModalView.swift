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
                HStack{
                    Spacer().frame(width: 55)
                    Text(verbatim: "Map-o-Art").frame(minWidth: 0, maxWidth: .infinity, alignment: .center).font(.title)
                    Button(action: {
                        print("dismisses form")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                Spacer()
                MapView(location: $locationManager.lastLocation)
            }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
