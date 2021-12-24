//
//  ChangeDrumItem.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI

struct ChangeDrumItem: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var context
    
    @Binding var drumItem: DrumItem
    @State public var  soundTitle: String = "Kick Sounds"
    @State private var sounds: [String] = []
    @State public var drumSet: DrumKit
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("")
                Text(soundTitle).font(.system(size: 30))
                
                List {
                    ForEach(sounds, id: \.self, content: { sound in
                        Text(sound).onTapGesture {
                            soundSelected(sound: sound)
                        }
                    })
                }
                
                HStack {
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.2) , height: geo.size.height * 0.2)
                        
                        Text("Back").foregroundColor(Color.white).font(.system(size: 19))
                        
                    }.onTapGesture {
                        KickPlayer.kick.playSound(sound: "kick1")
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    
                    Spacer()
                }
            }
            
        }.onAppear(perform: setTitle).onAppear(perform: setSounds)
    }
    
    func setTitle() {
        switch drumItem {
        case .kick:
            soundTitle = "Kick Sounds"
        case .snare:
            soundTitle = "Snare Sounds"
        case .rimshot:
            soundTitle = "Rimshot Sounds"
        case .sidestick:
            soundTitle = "SideStick Sounds"
        case .lowtom:
            soundTitle = "Low Tom Sounds"
        case .midtom:
            soundTitle = "Mid Tom Sounds"
        case .hitom:
            soundTitle = "Hi Tom Sounds"
        case .crash:
            soundTitle = "Crash Sounds"
        case .ride:
            soundTitle = "Ride Sounds"
        case .hihatclose:
            soundTitle = "Hi Hat Closed Sounds"
        case .hihatopen:
            soundTitle = "Hi Hat Open Sounds"
        case .random1:
            soundTitle = "Other Sounds"
        case .random2:
            soundTitle = "Other Sounds"
        }
    }
    
    func setSounds() {
        switch drumItem {
        
        case .kick:
            sounds = DrumSetSounds.Sounds.kickNames
        case .snare:
            sounds = DrumSetSounds.Sounds.snareNames
        case .rimshot:
            sounds = DrumSetSounds.Sounds.rimshotNames
        case .sidestick:
            sounds = DrumSetSounds.Sounds.sidestickNames
        case .lowtom:
            sounds = DrumSetSounds.Sounds.lowTomNames
        case .midtom:
            sounds = DrumSetSounds.Sounds.midTomNames
        case .hitom:
            sounds = DrumSetSounds.Sounds.hiTomNames
        case .crash:
            sounds = DrumSetSounds.Sounds.crashNames
        case .ride:
            sounds = DrumSetSounds.Sounds.rideNames
        case .hihatclose:
            sounds = DrumSetSounds.Sounds.hiHatClosedNames
        case .hihatopen:
            sounds = DrumSetSounds.Sounds.hiHatOpenNames
        case .random1:
            sounds = DrumSetSounds.Sounds.otherNames
        case .random2:
            sounds = DrumSetSounds.Sounds.otherNames
        }
    }
    
    func soundSelected(sound: String) {
        guard let index = sounds.firstIndex(of: sound) else {return}
        
        switch drumItem {
        
        case .kick:
            drumSet.kick = Int64(index)
            saveContext()
        case .snare:
            drumSet.snare = Int64(index)
            saveContext()
        case .rimshot:
            drumSet.rimshot = Int64(index)
            saveContext()
        case .sidestick:
            drumSet.sidestick = Int64(index)
            saveContext()
        case .lowtom:
            drumSet.lowtom = Int64(index)
            saveContext()
        case .midtom:
            drumSet.midtom = Int64(index)
            saveContext()
        case .hitom:
            drumSet.hitom = Int64(index)
            saveContext()
        case .crash:
            drumSet.crash = Int64(index)
            saveContext()
        case .ride:
            drumSet.ride = Int64(index)
            saveContext()
        case .hihatclose:
            drumSet.hihatclosed = Int64(index)
            saveContext()
        case .hihatopen:
            drumSet.hihatopen = Int64(index)
            saveContext()
        case .random1:
            drumSet.randomItem1 = Int64(index)
            saveContext()
        case .random2:
            drumSet.randomItem2 = Int64(index)
            saveContext()
        }
    }
    
    func saveContext() {
        do {
            try self.context.save()
        } catch {
            print("error saving")
            
            
        }
        
        self.presentationMode.wrappedValue.dismiss()
        
    }
}

