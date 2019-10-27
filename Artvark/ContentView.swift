//
//  ContentView.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/25/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State private var show_modal: Bool = false
    
    var body: some View {
        
        ZStack{
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            Button(action: {
                print("Button Pushed")
                self.show_modal = true
            }) {
                Text("Show Modal")
            }.sheet(isPresented: self.$show_modal) {
                ModalView()
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
