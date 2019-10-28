//
//  DrawView.swift
//  Artvark
//
//  Created by Taabish Kathawala on 10/26/19.
//  Copyright © 2019 Bag O. All rights reserved.
//

import SwiftUI
import PencilKit

struct DrawView: UIViewRepresentable {
    
    class CanvasCoordinator: NSObject, PKCanvasViewDelegate, PKToolPickerObserver {
        
        var control: DrawView
        
        init(_ control: DrawView) {
            self.control = control
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            print(#function)
        }
        
        func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {
            print(#function)
        }
        
        func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) {
            print(#function)
        }
        
        func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) {
            print(#function)
        }
        
        func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) {
            print(#function)
        }
    }
    
    func makeCoordinator() -> CanvasCoordinator {
        return CanvasCoordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<DrawView>) -> PKCanvasView {
        let canvasView = PKCanvasView()
        canvasView.delegate = context.coordinator
        canvasView.alwaysBounceVertical = false
        canvasView.allowsFingerDrawing = true
//        canvasView.drawing = PKDrawing
        canvasView.becomeFirstResponder()
        let window = UIApplication.shared.windows.last
        if window != nil {
            let toolPicker = PKToolPicker.shared(for: window!)
            toolPicker?.setVisible(true, forFirstResponder: canvasView)
            toolPicker?.addObserver(canvasView)
            toolPicker?.addObserver(context.coordinator)
            canvasView.becomeFirstResponder()
        }
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: UIViewRepresentableContext<DrawView>) {
        print ("Update UI View")
    }
    
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView()
    }
}

struct Draw: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 10.0, height: 20.0)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                }
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            DrawView()
        }.edgesIgnoringSafeArea(.bottom)

    }
}
