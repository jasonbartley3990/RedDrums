//
//  SelectSetForLoop.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct SelectSetForLoop: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var sets: [DrumKit] = []
    @Binding var selectedSet: DrumKit?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("")
                Text("Select Set").font(.system(size: 30))
                
                List {
                    ForEach(sets, id: \.self) { set in
                        HStack {
                            Spacer()
                            Text(set.name!).onTapGesture {
                                selectedSet = set
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
            
        }.onAppear(perform: fetchSets)
    }
    
    func fetchSets() {
        do {
            sets = try context.fetch(DrumKit.fetchRequest())
        } catch {
            print("opps")
        }
    }
    
}

