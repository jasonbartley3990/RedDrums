//
//  askingWhichNote.swift
//  RedDrums
//
//  Created by Jason bartley on 12/8/21.
//

import SwiftUI

struct askingWhichNote: View {
    
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    @Binding var isSecond: Bool
    
    var onDone: (Bool) -> Void = { selection in
        
    }
    
    var onCancel: () -> Void = {
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Is this the first or second").font(.largeTitle).multilineTextAlignment(.center)
                        Text("note on this bar?").font(.largeTitle).multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                
                HStack {
                    Button("First") {
                        self.onDone(false)
                        self.isShown = false
                    }.padding()
                    
                    Button("Second") {
                        self.onDone(true)
                        self.isShown = false
                    }.padding()
                }
                Spacer()
            }
        }.frame(width: screenSize.width * 0.6, height: screenSize.height * 0.6)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .background(Color.white)
        
    }
}


