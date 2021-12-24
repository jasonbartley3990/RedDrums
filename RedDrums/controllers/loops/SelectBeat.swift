//
//  SelectBeat.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct SelectBeat: View {
    @Environment(\.presentationMode) var presentationMode
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @State private var loops: [Beat] = []
    
    @Binding var selectedBeat: Beat?
    
    var onSelection: (Beat) -> Void = { loop in
        
    }
    
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("")
                Text("Select Beat").font(.system(size: 30))
                
                List {
                    ForEach(loops, id: \.self) { loop in
                        HStack {
                            Spacer()
                            Text(loop.name!).onTapGesture {
                                selectedBeat = loop
                                presentationMode.wrappedValue.dismiss()
                            }
                            Spacer()
                        }
                    }
                    
                }
                
                
                HStack {
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.2) , height: geo.size.height * 0.2)
                        
                        Text("Back").foregroundColor(Color.white).font(.system(size: 19))
                        
                    }.onTapGesture {
                        KickPlayer.kick.playSound(sound: "kick1")
                        presentationMode.wrappedValue.dismiss()
                    }.padding()
                    
                    
                    Spacer()
                }
            }
            
        }.onAppear(perform: fetchLoops)
    }
    
    func fetchLoops() {
        do {
            loops = try context.fetch(Beat.fetchRequest())
        } catch {
            print("opps")
        }
    }
    
}
        
