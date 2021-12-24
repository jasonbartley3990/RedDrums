//
//  NewSetNameAlert.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct NewSetNameAlert: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    @Binding var text: String
    
    var onDone: (String) -> Void = { name in
        
    }
    
    var onCancel: () -> Void = {
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                Text("Name of new Set").font(.largeTitle)
                TextField("", text: $text).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.leading, .trailing], 20)
                    
                HStack {
                    Button("submit") {
                        self.onDone(text)
                        self.isShown = false
                    }.padding()
                    
                    Button("cancel") {
                        self.isShown = false
                        self.onCancel()
                    }.padding()
                }
                Spacer()
            }
        }.frame(width: screenSize.width * 0.6, height: screenSize.height * 0.6)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .background(Color.white)
        
    }
}

struct NewSetNameAlert_Previews: PreviewProvider {
    static var previews: some View {
        NewSetNameAlert(isShown: .constant(true), text: .constant(""))
    }
}

