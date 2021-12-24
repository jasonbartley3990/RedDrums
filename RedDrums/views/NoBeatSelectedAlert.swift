//
//  NoBeatSelectedAlert.swift
//  RedDrums
//
//  Created by Jason bartley on 12/10/21.
//

import SwiftUI

struct NoBeatSelectedAlert: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    
    var body: some View {
        GeometryReader { geo in
                
            VStack(alignment: .center) {
                Spacer()
                
                HStack {
                    Spacer()
                    Text("No beat Selected!").font(.largeTitle)
                    Spacer()
                    
                }
                
                
                
                Button("ok") {
                    self.isShown = false
                }.padding()
                
                Spacer()
            }
           
        }.frame(width: screenSize.width * 0.6, height: screenSize.height * 0.6)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .background(Color.white)
        
    }
}


