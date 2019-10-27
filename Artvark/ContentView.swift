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
    @State private var show_draw_tool: Bool = false
    
    var body: some View {

        NavigationView{
            ZStack{
                ARViewContainer()
                VStack{
                    Spacer()
                    Divider()
                    HStack{
                        Spacer()
                        Button(action: {
                            print ("Button pushed")
                            self.show_modal = true
                        }) {
                            Text(verbatim: "Art")
                                .fontWeight(.medium)
                                .font(.title)
                                .padding()
        //                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .trailing, endPoint: .leading))
                                .background(Color.gray)
                                 .foregroundColor(.white)
                            .cornerRadius(20)
                        }.sheet(isPresented: self.$show_modal) {
                            ModalView()
                        }
                        Spacer()

                        NavigationLink(destination: DrawView()) {
                                Text(verbatim: "Draw")
                                    .fontWeight(.medium)
                                    .font(.title)
                                    .padding()
        //                            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .trailing, endPoint: .leading))
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        Spacer()
                    }
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 10))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }.edgesIgnoringSafeArea(.all)
        }.navigationBarHidden(true)
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
