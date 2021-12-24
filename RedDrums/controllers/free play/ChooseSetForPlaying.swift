//
//  ChooseSetForPlaying.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct ChooseSetForPlaying: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var sets: [DrumKit] = []
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("")
                Text("Select Set").font(.system(size: 30))
                
                List {
                    ForEach(sets, id: \.self) { set in
                        HStack {
                            Spacer()
                            NavigationLink(destination: DrumSet(isStandard: false, set: set).environment(\.managedObjectContext, context), label: {
                                Text(set.name!).font(.headline)
                            })
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
        .onAppear(perform: playHHOpen)
    }
    
    func playHHOpen() {
        CrashPlayer.crash.playSound(sound: "hiHatOpen1")
    }
    
    func fetchSets() {
        do {
            sets = try context.fetch(DrumKit.fetchRequest())
            print(sets)
        } catch {
            print("opps")
        }
    }
    
}


struct ChooseSetForPlaying_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSetForPlaying()
    }
}
