//
//  SelectedNoteEdit.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct SelectedNoteEdit: View {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @Environment(\.presentationMode) var presentationMode
    
    public var bar: String
    public var subBar: String
    
    public var beat: Beat?
    
    public var isHalf = false
    @State public var isSecondNote = false
    
    @State public var showingWhichNote = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                HStack {
                
                VStack {
                    
                    Spacer()
                    
                    Text("select Note").foregroundColor(Color.white).font(.system(size: 25))
                
                    
                    HStack {
                        VStack(alignment: .center) {
                            
                            Spacer()
                            
                            ZStack {
                                Circle().fill(Color.red).frame(width: (geo.size.height * 0.35) - 5, height: (geo.size.height * 0.35) - 5, alignment: .center).onTapGesture {
                                    playKick()
                                    HapticsManager.shared.hapticShakeIntense()
                                    updateNote(note: .kick)
                                    }
                                
                                Text("Kick").foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Circle().fill(Color.red).frame(width: (geo.size.height * 0.35) - 5, height: (geo.size.height * 0.35) - 5, alignment: .center).onTapGesture {
                                    playSnare()
                                    HapticsManager.shared.hapticShakeIntense()
                                    updateNote(note: .snare)
                                    }
                                
                                Text("Snare").foregroundColor(.white)
                           
                            }
                            
                            Spacer()
                            
                        }
                        VStack(alignment: .center) {
                            
                            Spacer()
                            
                            ZStack {
                                Circle().fill(Color.red).frame(width: (geo.size.height * 0.35) - 5, height: (geo.size.height * 0.35) - 5, alignment: .center).onTapGesture {
                                    playLowTom()
                                    HapticsManager.shared.hapticShakeMedium()
                                    updateNote(note: .lowtom)
                                }
                                
                                Text("Low Tom").foregroundColor(.white)
                           
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Circle().fill(Color.red).frame(width: (geo.size.height * 0.35) - 5, height: (geo.size.height * 0.35) - 5, alignment: .center).onTapGesture {
                                    playRimshot()
                                    HapticsManager.shared.hapticShakeIntense()
                                    updateNote(note: .rimshot)
                                }
                                
                                Text("Rim Shot").foregroundColor(.white)
                           
                            }
                            
                            Spacer()
                        }
                    }
                }
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                            playMidTom()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .midtom)
                        }
                        
                        Text("Mid Tom").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                            playHighTom()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .hitom)
                        }
                        
                        Text("Hi Tom").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                            playSideStick()
                            HapticsManager.shared.hapticShakeIntense()
                            updateNote(note: .sidestick)
                        }
                        
                        Text("Side Stick").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                }
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                            playCrash()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .crash)
                        }
                        
                        Text("Crash").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                            playRandom1()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .random1)
                        }
                        
                        Text("Other 1").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                            playRandom2()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .random2)
                        }
                        
                        Text("Other 2").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.green).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        Text("Back").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                            playRide()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .ride)
                        }
                        
                        Text("Ride").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                            playHighHatOpen()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .hihatopen)
                        }
                        
                        Text("HH Open").foregroundColor(.white)
                   
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                            if HighHatOpenPlayer.HighHat.isPlaying() == true {
                                HighHatOpenPlayer.HighHat.stopPlaying()
                            }
                            playHighHatClose()
                            HapticsManager.shared.hapticShakeMedium()
                            updateNote(note: .hihatclose)
                            
                        }
                        
                        Text("HH Close").foregroundColor(.white)
                        
                    }
                    
                    Spacer()
                    
                    
                }.background(Color.black).onAppear(perform: {
                    prepareHaptics()
                })
            }
                VStack {
                    Spacer()
                
                    askingWhichNote(isShown: $showingWhichNote, isSecond: $isSecondNote, onDone:  { response in
                        isSecondNote = response
                        
                    }).opacity(showingWhichNote ? 1 : 0).environment(\.managedObjectContext, context).clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                }
            }
        }.onAppear(perform: printsom)
    }
    
    private func printsom() {
        print(bar)
        print(subBar)
    }
    
    private func playKick() {
        
        KickPlayer.kick.playSound(sound: "kick1")
        
    }
    
    private func playHighHatClose() {
        
        HighHatClosePlayer.HighHat.playSound(sound: "highHatClosed1")
        
        
    }
    
    private func playSnare() {
        
        SnarePlayer.snare.playSound(sound: "snare1")
        
        
    }
    
    private func playRimshot() {
        
        SnareRimShotPlayer.RimShot.playSound(sound: "rimshot1")
        
    }
    
    private func playRide() {
        
        RidePlayer.ride.playSound(sound: "ride1")
        
    }
    
    private func playCrash() {
        
        CrashPlayer.crash.playSound(sound: "crash1")
        
        
    }
    
    private func playHighHatOpen() {
        
        HighHatOpenPlayer.HighHat.playSound(sound: "hiHatOpen1")
        
    }
    
    private func playLowTom() {
        
        LowTomPlayer.LowTom.playSound(sound: "lowTom1")
        
        
    }
    
    private func playMidTom() {
        
        MidTomPlayer.MidTom.playSound(sound: "midTom1")
        
    }
    
    private func playHighTom() {
        
        HighTomPlayer.HighTom.playSound(sound: "hiTom1")
        
        
    }
    
    private func playSideStick() {
        
        SideStickPlayer.sidestick.playSound(sound: "sidestick1")
        
        
    }
    
    private func playRandom1() {
        
        RandomItem1Player.random.playSound(sound: "shaker1")
        
    }
    
    private func playRandom2() {
        
        RandomItem1Player.random.playSound(sound: "cowbell1")
        
    }
    
    private func prepareHaptics() {
        HapticsManager.shared.prepareHaptics()
    }
    
    private func updateNote(note: DrumItem) {
        if bar == "1" {
            if subBar == "1" {
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat11Half = instrumentStrings.kickString
                        print("kick")
                    case .snare:
                        beat?.beat11Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat11Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat11Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat11Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat11Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat11Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat11Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat11Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat11Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat11Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat11Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat11Half = instrumentStrings.random2String
                    }
                    
                    do {
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat11Second = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat11Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat11Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat11Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat11Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat11Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat11Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat11Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat11Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat11Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat11Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat11Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat11Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        switch note {
                        case .kick:
                            beat?.beat11First = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat11First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat11First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat11First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat11First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat11First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat11First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat11First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat11First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat11First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat11First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat11First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat11First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
                
            } else if subBar == "2" {
                if isHalf {
                    switch note {
                    case .kick:
                        beat?.beat12Half = instrumentStrings.kickString
                        print("kick")
                    case .snare:
                        beat?.beat12Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat12Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat12Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat12Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat12Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat12Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat12Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat12Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat12Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat12Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat12Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat12Half = instrumentStrings.random2String
                    }
                    
                    do {
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat12Second = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat12Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat12Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat12Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat12Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat12Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat12Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat12Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat12Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat12Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat12Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat12Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat12Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        switch note {
                        
                        case .kick:
                            beat?.beat12First = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat12First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat12First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat12First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat12First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat12First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat12First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat12First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat12First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat12First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat12First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat12First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat12First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
                
            } else if subBar == "3" {
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat13Half = instrumentStrings.kickString
                        print("kick")
                    case .snare:
                        beat?.beat13Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat13Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat13Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat13Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat13Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat13Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat13Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat13Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat13Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat13Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat13Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat13Half = instrumentStrings.random2String
                    }
                    
                    do {
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat13Second = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat13Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat13Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat13Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat13Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat13Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat13Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat13Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat13Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat13Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat13Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat13Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat13Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        switch note {
                        
                        case .kick:
                            beat?.beat13First = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat13First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat13First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat13First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat13First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat13First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat13First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat13First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat13First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat13First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat13First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat13First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat13First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    }
                }
                
            } else if subBar == "4" {
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat14Half = instrumentStrings.kickString
                        print("kick")
                    case .snare:
                        beat?.beat14Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat14Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat14Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat14Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat14Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat14Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat14Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat14Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat14Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat14Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat14Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat14Half = instrumentStrings.random2String
                        
                    }
                    
                    do {
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                } else {
                    
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat14Second = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat14Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat14Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat14Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat14Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat14Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat14Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat14Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat14Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat14Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat14Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat14Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat14Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        switch note {
                        
                        case .kick:
                            beat?.beat14First = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat14First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat14First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat14First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat14First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat14First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat14First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat14First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat14First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat14First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat14First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat14First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat14First = instrumentStrings.random2String
                        }
                        
                        do {
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
                
            }
        } else if bar == "2" {
            if subBar == "1" {
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat21Half = instrumentStrings.kickString
                        print("kick note")
                    case .snare:
                        beat?.beat21Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat21Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat21Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat21Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat21Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat21Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat21Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat21Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat21Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat21Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat21Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat21Half = instrumentStrings.random2String
                        
                    }
                    
                    do {
                        print("saving 2-1 half")
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat21Second = instrumentStrings.kickString
                            print("kick note")
                        case .snare:
                            beat?.beat21Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat21Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat21Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat21Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat21Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat21Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat21Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat21Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat21Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat21Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat21Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat21Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-1 second")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        switch note {
                        case .kick:
                            beat?.beat21First = instrumentStrings.kickString
                            print("kick note")
                        case .snare:
                            beat?.beat21First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat21First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat21First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat21First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat21First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat21First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat21First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat21First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat21First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat21First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat21First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat21First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-1 first")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
                
            } else if subBar == "2" {
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat22Half = instrumentStrings.kickString
                        print("kick note")
                    case .snare:
                        beat?.beat22Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat22Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat22Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat22Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat22Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat22Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat22Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat22Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat22Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat22Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat22Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat22Half = instrumentStrings.random2String
                        
                    }
                    
                    do {
                        print("saving 2-2 half")
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat22Second = instrumentStrings.kickString
                            print("kick note")
                        case .snare:
                            beat?.beat22Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat22Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat22Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat22Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat22Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat22Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat22Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat22Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat22Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat22Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat22Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat22Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-2 second")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        print("22 first")
                        
                        switch note {
                        case .kick:
                            beat?.beat22First = instrumentStrings.kickString
                            print("kick note")
                        case .snare:
                            beat?.beat22First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat22First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat22First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat22First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat22First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat22First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat22First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat22First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat22First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat22First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat22First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat22First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-2 first")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
                
            } else if subBar == "3" {
                
                print("sub bar 3")
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat23Half = instrumentStrings.kickString
                        print("kick")
                    case .snare:
                        beat?.beat23Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat23Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat23Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat23Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat23Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat23Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat23Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat23Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat23Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat23Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat23Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat23Half = instrumentStrings.random2String
                        
                    }
                    
                    do {
                        print("we savin 2-3 half")
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat23Second = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat23Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat23Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat23Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat23Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat23Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat23Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat23Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat23Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat23Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat23Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat23Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat23Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-3 second")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        switch note {
                        case .kick:
                            beat?.beat23First = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat23First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat23First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat23First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat23First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat23First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat23First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat23First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat23First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat23First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat23First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat23First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat23First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-3 first")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
                
            } else if subBar == "4" {
                if isHalf {
                    switch note {
                    
                    case .kick:
                        beat?.beat24Half = instrumentStrings.kickString
                        
                    case .snare:
                        beat?.beat24Half = instrumentStrings.snareString
                    case .rimshot:
                        beat?.beat24Half = instrumentStrings.rimshotString
                    case .sidestick:
                        beat?.beat24Half = instrumentStrings.sidestickString
                    case .lowtom:
                        beat?.beat24Half = instrumentStrings.lowTomString
                    case .midtom:
                        beat?.beat24Half = instrumentStrings.midTomString
                    case .hitom:
                        beat?.beat24Half = instrumentStrings.hiTomString
                    case .crash:
                        beat?.beat24Half = instrumentStrings.crashString
                    case .ride:
                        beat?.beat24Half = instrumentStrings.rideString
                    case .hihatclose:
                        beat?.beat24Half = instrumentStrings.hhCloseString
                    case .hihatopen:
                        beat?.beat24Half = instrumentStrings.hhOpenString
                    case .random1:
                        beat?.beat24Half = instrumentStrings.random1String
                    case .random2:
                        beat?.beat24Half = instrumentStrings.random2String
                    }
                    
                    do {
                        print("saving 2-4 half")
                        try context.save()
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("could not save")
                    }
                    
                } else {
                    
                    if isSecondNote {
                        switch note {
                        case .kick:
                            beat?.beat24Second = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat24Second = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat24Second = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat24Second = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat24Second = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat24Second = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat24Second = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat24Second = instrumentStrings.crashString
                        case .ride:
                            beat?.beat24Second = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat24Second = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat24Second = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat24Second = instrumentStrings.random1String
                        case .random2:
                            beat?.beat24Second = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-4 second")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        switch note {
                        case .kick:
                            beat?.beat24First = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat24First = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat24First = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat24First = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat24First = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat24First = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat24First = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat24First = instrumentStrings.crashString
                        case .ride:
                            beat?.beat24First = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat24First = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat24First = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat24First = instrumentStrings.random1String
                        case .random2:
                            beat?.beat24First = instrumentStrings.random2String
                            
                        }
                        
                        do {
                            print("saving 2-4 first")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                    }
                }
            }
            } else if bar == "3" {
                if subBar == "1" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat31half = instrumentStrings.kickString
                            print("kick")
                        case .snare:
                            beat?.beat31half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat31half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat31half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat31half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat31half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat31half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat31half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat31half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat31half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat31half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat31half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat31half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 3-1 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                            
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        if isSecondNote {
                            switch note {
                            case .kick:
                                beat?.beat31Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat31Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat31Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat31Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat31Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat31Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat31Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat31Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat31Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat31Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat31Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat31Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat31Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 3-1 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                            
                        } else {
                            
                            switch note {
                            case .kick:
                                beat?.beat31First = instrumentStrings.kickString
                                print("kick")
                            case .snare:
                                beat?.beat31First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat31First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat31First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat31First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat31First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat31First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat31First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat31First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat31First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat31First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat31First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat31First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("print saving 3-1 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        }
                        
                    }
                    
                } else if subBar == "2" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat32Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat32Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat32Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat32Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat32Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat32Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat32Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat32Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat32Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat32Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat32Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat32Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat32Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 3-2 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        if isSecondNote {
                            switch note {
                            case .kick:
                                beat?.beat32Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat32Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat32Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat32Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat32Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat32Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat32Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat32Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat32Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat32Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat32Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat32Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat32Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 3-2 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                            
                        } else {
                            switch note {
                            case .kick:
                                beat?.beat32First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat32First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat32First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat32First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat32First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat32First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat32First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat32First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat32First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat32First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat32First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat32First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat32First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 3-2 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        }
                    }
                    
                } else if subBar == "3" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat33Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat33Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat33Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat33Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat33Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat33Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat33Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat33Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat33Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat33Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat33Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat33Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat33Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 3-3 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        if isSecondNote {
                            
                            switch note {
                            case .kick:
                                beat?.beat33Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat33Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat33Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat33Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat33Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat33Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat33Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat33Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat33Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat33Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat33Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat33Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat33Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 3-3 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                            
                        } else {
                            switch note {
                            case .kick:
                                beat?.beat33First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat33First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat33First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat33First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat33First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat33First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat33First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat33First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat33First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat33First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat33First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat33First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat33First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("3-3 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        }
                        
                    }
                    
                } else if subBar == "4" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat34Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat34Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat34Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat34Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat34Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat34Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat34Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat34Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat34Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat34Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat34Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat34Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat34Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 3-4 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        if isSecondNote {
                            
                            switch note {
                            case .kick:
                                beat?.beat34Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat34Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat34Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat34Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat34Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat34Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat34Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat34Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat34Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat34Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat34Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat34Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat34Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 3-4 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                            
                        } else {
                            
                            switch note {
                            case .kick:
                                beat?.beat34First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat34First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat34First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat34First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat34First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat34First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat34First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat34First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat34First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat34First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat34First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat34First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat34First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 3-4 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        }
                    }
                    
                }
                
            } else if bar == "4" {
                if subBar == "1" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat41Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat41Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat41Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat41Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat41Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat41Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat41Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat41Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat41Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat41Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat41Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat41Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat41Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 4-1 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        if isSecondNote {
                            
                            switch note {
                            case .kick:
                                beat?.beat41Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat41Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat41Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat41Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat41Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat41Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat41Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat41Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat41Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat41Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat41Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat41Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat41Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4 - 1 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        } else {
                            
                            switch note {
                            case .kick:
                                beat?.beat41First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat41First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat41First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat41First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat41First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat41First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat41First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat41First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat41First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat41First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat41First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat41First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat41First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-1 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        }
                        
                    }
                    
                } else if subBar == "2" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat42Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat42Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat42Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat42Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat42Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat42Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat42Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat42Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat42Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat42Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat42Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat42Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat42Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 4-2 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        
                        if isSecondNote {
                            switch note {
                            case .kick:
                                beat?.beat42Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat42Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat42Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat42Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat42Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat42Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat42Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat42Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat42Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat42Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat42Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat42Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat42Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-2 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                            
                        } else {
                            
                            switch note {
                            case .kick:
                                beat?.beat42First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat42First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat42First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat42First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat42First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat42First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat42First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat42First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat42First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat42First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat42First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat42First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat42First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-2 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                            
                        }
                    }
                    
                } else if subBar == "3" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat43Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat43Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat43Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat43Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat43Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat43Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat43Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat43Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat43Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat43Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat43Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat43Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat43Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 4-3 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        if isSecondNote {
                            switch note {
                            case .kick:
                                beat?.beat43Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat43Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat43Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat43Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat43Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat43Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat43Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat43Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat43Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat43Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat43Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat43Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat43Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-3 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        } else {
                            
                            switch note {
                            case .kick:
                                beat?.beat43First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat43First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat43First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat43First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat43First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat43First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat43First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat43First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat43First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat43First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat43First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat43First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat43First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-3 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("could not save")
                            }
                        }
                    }
                    
                } else if subBar == "4" {
                    if isHalf {
                        switch note {
                        
                        case .kick:
                            beat?.beat44Half = instrumentStrings.kickString
                            
                        case .snare:
                            beat?.beat44Half = instrumentStrings.snareString
                        case .rimshot:
                            beat?.beat44Half = instrumentStrings.rimshotString
                        case .sidestick:
                            beat?.beat44Half = instrumentStrings.sidestickString
                        case .lowtom:
                            beat?.beat44Half = instrumentStrings.lowTomString
                        case .midtom:
                            beat?.beat44Half = instrumentStrings.midTomString
                        case .hitom:
                            beat?.beat44Half = instrumentStrings.hiTomString
                        case .crash:
                            beat?.beat44Half = instrumentStrings.crashString
                        case .ride:
                            beat?.beat44Half = instrumentStrings.rideString
                        case .hihatclose:
                            beat?.beat44Half = instrumentStrings.hhCloseString
                        case .hihatopen:
                            beat?.beat44Half = instrumentStrings.hhOpenString
                        case .random1:
                            beat?.beat44Half = instrumentStrings.random1String
                        case .random2:
                            beat?.beat44Half = instrumentStrings.random2String
                        }
                        
                        do {
                            print("saving 4-4 half")
                            try context.save()
                            presentationMode.wrappedValue.dismiss()
                            
                        } catch {
                            print("could not save")
                        }
                        
                    } else {
                        if isSecondNote {
                            switch note {
                            case .kick:
                                beat?.beat44Second = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat44Second = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat44Second = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat44Second = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat44Second = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat44Second = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat44Second = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat44Second = instrumentStrings.crashString
                            case .ride:
                                beat?.beat44Second = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat44Second = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat44Second = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat44Second = instrumentStrings.random1String
                            case .random2:
                                beat?.beat44Second = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-4 second")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                                
                            } catch {
                                print("could not save")
                            }
                            
                        } else {
                            
                            switch note {
                            case .kick:
                                beat?.beat44First = instrumentStrings.kickString
                                
                            case .snare:
                                beat?.beat44First = instrumentStrings.snareString
                            case .rimshot:
                                beat?.beat44First = instrumentStrings.rimshotString
                            case .sidestick:
                                beat?.beat44First = instrumentStrings.sidestickString
                            case .lowtom:
                                beat?.beat44First = instrumentStrings.lowTomString
                            case .midtom:
                                beat?.beat44First = instrumentStrings.midTomString
                            case .hitom:
                                beat?.beat44First = instrumentStrings.hiTomString
                            case .crash:
                                beat?.beat44First = instrumentStrings.crashString
                            case .ride:
                                beat?.beat44First = instrumentStrings.rideString
                            case .hihatclose:
                                beat?.beat44First = instrumentStrings.hhCloseString
                            case .hihatopen:
                                beat?.beat44First = instrumentStrings.hhOpenString
                            case .random1:
                                beat?.beat44First = instrumentStrings.random1String
                            case .random2:
                                beat?.beat44First = instrumentStrings.random2String
                                
                            }
                            
                            do {
                                print("saving 4-4 first")
                                try context.save()
                                presentationMode.wrappedValue.dismiss()
                                
                            } catch {
                                print("could not save")
                            }
                        }
                        
                }
                
            }
            
        }
    }
    }
    

