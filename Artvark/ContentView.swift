//
//  ContentView.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/25/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

// Color pallete: https://colorhunt.co/palette/159621

import SwiftUI
import RealityKit

struct ContentView : View {
    @State private var show_map_modal: Bool = false
    @State private var show_draw_tool: Bool = false
    @State private var action: Int? = 0
    
    var body: some View {

        NavigationView{
            ZStack{
//                ARViewContainer()
                VStack{
                    Spacer()
                    NavigationLink(destination: Draw(), tag: 1, selection: $action) {
                        EmptyView()
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    HStack{
                        Spacer()
                        Button(action: {
                            print ("Button pushed")
                            self.show_map_modal = true
                        }) {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                                .padding()
        //                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .trailing, endPoint: .leading))
                                .background(Color.init(0xe3e7f1))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                        }.sheet(isPresented: self.$show_map_modal) {
                            ModalView()
                        }
                        
                        Spacer().fixedSize()
                        
                        Button(action: {
                            print ("Button pushed")
                        }) {
                            Image(systemName: "pencil.and.outline")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                                .padding()
                                //.background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .trailing, endPoint: .leading))
                                .background(Color.init(0xe3e7f1))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .onTapGesture {
                                    self.action = 1
                                }
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

extension Color {
    init(_ hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
