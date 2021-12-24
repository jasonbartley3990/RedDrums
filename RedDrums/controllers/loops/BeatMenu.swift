//
//  BeatMenu.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

struct BeatMenu: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentSet: DrumKit?
    @State private var currentBeat: Beat?
    @State private var currentBar = "1"
    @State private var currentSubBar = "1"
    @State private var showingBeats = false
    @State private var showingSets = false
    @State private var showingNoBeatAlert = false
    @State private var showingNoSetAlert = false
    @State private var BPM: Double = 140
    @State private var isPlaying = false
    
    
    @State private var kickSound: String = ""
    @State private var snareSound: String = ""
    @State private var sidestickSound: String = ""
    @State private var rimshotSound: String = ""
    @State private var lowTomSound: String = ""
    @State private var midTomSound: String = ""
    @State private var hiTomSound: String = ""
    @State private var crashSound: String = ""
    @State private var rideSound: String = ""
    @State private var HHCloseSound: String = ""
    @State private var HHOpenSound: String = ""
    @State private var random1Sound: String = ""
    @State private var random2Sound: String = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                HStack {
                    
                    VStack {
                        Text("Current Beat:").foregroundColor(Color.red).font(.system(size: 27))
                        Text(currentBeat?.name ?? "no selected beat").foregroundColor(Color.white).font(.system(size: 23))
                        
                        Text("")
                        
                        Text("Current Drum Set:").foregroundColor(Color.red).font(.system(size: 27))
                        Text(currentSet?.name ?? "no selected set" ).foregroundColor(Color.white).font(.system(size: 23))
                        
                        Spacer()
                        
                        HStack {
                            Text("BPM: ").foregroundColor(Color.red).font(.system(size: 24))
                            Text(String(BPM)).foregroundColor(Color.red).font(.system(size: 24))
                        }
                        
                        HStack {
                            Image(systemName: "arrowtriangle.left.fill").resizable().foregroundColor(Color.white).frame(width: 35, height: 35).onTapGesture {
                                decreaseBPM()
                            }
                            
                            Text(" ")
                            
                            Image(systemName: "arrowtriangle.right.fill").resizable().foregroundColor(Color.white).frame(width: 35, height: 35).onTapGesture {
                                increaseBPM()
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                        
                            ZStack {
                                ZStack {
                                    Circle().fill(Color.red).frame(width: (geo.size.height * 0.3) , height: geo.size.height * 0.25)
                                    
                                    Text("Back").foregroundColor(Color.white).font(.system(size: 19))
                                    
                                }.onTapGesture {
                                    isPlaying = false
                                    KickPlayer.kick.playSound(sound: "kick1")
                                    presentationMode.wrappedValue.dismiss()
                                }
                                
                            }
                            
                            ZStack {
                                Circle().fill(Color.white).frame(width: (geo.size.height * 0.3) , height: geo.size.height * 0.25)
                                
                                NavigationLink(destination: CreateBeatMenu().environment(\.managedObjectContext, context), label: {
                                    VStack {
                                        Text("Create").foregroundColor(Color.black).font(.system(size: 14)
                                        )
                                        Text("New Beat").foregroundColor(Color.black).font(.system(size: 14)
                                        )
                                    }
                                    
                                })
                                
                            }.onDisappear(perform: {
                                isPlaying = false
                            })
                            
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                       
                        Spacer()
                        
                        Image(systemName: isPlaying ? "pause.circle" : "play").resizable().scaledToFill().foregroundColor(Color.white).frame(width: geo.size.height * 0.5, height: geo.size.height * 0.5).onTapGesture {
                            
                            guard currentSet != nil else  {
                                showingNoSetAlert = true
                                return
                            
                            }
                            
                            guard currentBeat != nil else {
                                showingNoBeatAlert = true
                                return
                            }
                            
                            if isPlaying {
                                stopLoop()
                            } else {
                                isPlaying = true
                                setUpSounds()
                                playSubBar1()
                            }
                        }
                        
                        HStack {
                            Text(currentBar).foregroundColor(Color.white).font(.system(size: 60))
                            Text(currentSubBar).foregroundColor(Color.white).font(.system(size: 40))
                        }
                       
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    Spacer()
                    
                    VStack {
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.3) , height: geo.size.height * 0.3)

                            Text("Change Beat").foregroundColor(Color.white).font(.system(size: 15))

                        }.onTapGesture {
                            KickPlayer.kick.playSound(sound: "kick1")
                            showingBeats = true
                            reset()

                        } .sheet(isPresented: $showingBeats, content: {
                            SelectBeat(selectedBeat: $currentBeat).environment(\.managedObjectContext, context)
                        })
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.3) , height: geo.size.height * 0.3)
                            
                            Text("Change Set").foregroundColor(Color.white).font(.system(size: 15))
                            
                        }.onTapGesture {
                            SideStickPlayer.sidestick.playSound(sound: "sidestick1")
                            showingSets = true
                            reset()
                        }.sheet(isPresented: $showingSets, content: {
                            SelectSetForLoop(selectedSet: $currentSet).environment(\.managedObjectContext, context)
                        })
                       
                        NavigationLink(destination: EditBeatMenu(), label: {
                            ZStack {
                                Circle().fill(Color.red).frame(width: (geo.size.height * 0.3) , height: geo.size.height * 0.3)
                                
                                Text("Edit Beats").foregroundColor(Color.white).font(.system(size: 15))
                                
                            }
                            
                        })
                        
                    }
                    
                    
                    
                    
                }
                
                VStack {
                    Spacer()
                    
                    NoBeatSelectedAlert(isShown: $showingNoBeatAlert).opacity(showingNoBeatAlert ? 1 : 0).environment(\.managedObjectContext, context).clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    NoSetSelectedAlert(isShown: $showingNoSetAlert).opacity(showingNoSetAlert ? 1 : 0).environment(\.managedObjectContext, context).clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                }
                
            }.onAppear(perform: reset)
            
        }
        
       
    }
    
    func setUpSounds() {
        self.kickSound = DrumSetSounds.Sounds.KickSounds[Int(currentSet!.kick)]
        self.snareSound = DrumSetSounds.Sounds.SnareSounds[Int(currentSet!.snare)]
        self.sidestickSound = DrumSetSounds.Sounds.SidestickSounds[Int(currentSet!.sidestick)]
        self.rimshotSound = DrumSetSounds.Sounds.RimshotSounds[Int(currentSet!.rimshot)]
        self.lowTomSound = DrumSetSounds.Sounds.LowTomSounds[Int(currentSet!.lowtom)]
        self.midTomSound = DrumSetSounds.Sounds.MidTomSounds[Int(currentSet!.midtom)]
        self.hiTomSound = DrumSetSounds.Sounds.HiTomSounds[Int(currentSet!.hitom)]
        self.crashSound = DrumSetSounds.Sounds.CrashSounds[Int(currentSet!.crash)]
        self.rideSound = DrumSetSounds.Sounds.RideSounds[Int(currentSet!.ride)]
        self.HHCloseSound = DrumSetSounds.Sounds.HiHatCloseSounds[Int(currentSet!.hihatclosed)]
        self.HHOpenSound = DrumSetSounds.Sounds.HiHatOpenSounds[Int(currentSet!.hihatopen)]
        self.random1Sound = DrumSetSounds.Sounds.otherSounds[Int(currentSet!.randomItem1)]
        self.random2Sound = DrumSetSounds.Sounds.otherSounds[Int(currentSet!.randomItem2)]
        
    }
    
    func playSubBar1() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat11()
                playBeat11Second()
            case "2":
                playBeat21()
                playBeat21Second()
            case "3":
                playBeat31()
                playBeat31Second()
            case "4":
                playBeat41()
                playBeat41Second()
            default:
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar1Half()
            })
        }
    }
    
    func playSubBar1Half() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat11Half()
            case "2":
                playBeat21Half()
            case "3":
                playBeat31Half()
            case "4":
                playBeat41Half()
            default:
                return
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar2()
                incrementSubBar()
            })
        }
    }
    
    func playSubBar2() {
        if isPlaying {
            
            switch currentBar {
            case "1":
                playBeat12()
                playBeat12Second()
            case "2":
                playBeat22()
                playBeat22Second()
            case "3":
                playBeat32()
                playBeat32Second()
            case "4":
                playBeat42()
                playBeat42Second()
            default:
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar2Half()
            })
        }
        
    }
    
    func playSubBar2Half() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat12Half()
            case "2":
                playBeat22Half()
            case "3":
                playBeat32Half()
            case "4":
                playBeat42Half()
            default:
                return
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar3()
                incrementSubBar()
            })
        }
    }
    
    func playSubBar3() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat13()
                playBeat13Second()
            case "2":
                playBeat23()
                playBeat23Second()
            case "3":
                playBeat33()
                playBeat33Second()
            case "4":
                playBeat43()
                playBeat43Second()
            default:
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar3Half()
            })
        }
    }
    
    func playSubBar3Half() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat13Half()
            case "2":
                playBeat23Half()
            case "3":
                playBeat33Half()
            case "4":
                playBeat43Half()
            default:
                return
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar4()
                incrementSubBar()
            })
        }
    }
    
    func playSubBar4() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat14()
                playBeat14Second()
            case "2":
                playBeat24()
                playBeat24Second()
            case "3":
                playBeat34()
                playBeat34Second()
            case "4":
                playBeat44()
                playBeat44Second()
            default:
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                playSubBar4Half()
            })
        }
    }
    
    func playSubBar4Half() {
        if isPlaying {
            switch currentBar {
            case "1":
                playBeat14Half()
            case "2":
                playBeat24Half()
            case "3":
                playBeat34Half()
            case "4":
                playBeat44Half()
            default:
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + ((60/BPM) * 0.5), execute: {
                incrementBar()
                incrementSubBar()
                playSubBar1()
            })
        }
    }
    
    private func reset() {
        isPlaying = false
        currentBar = "1"
        currentSubBar = "1"
    }
    
    func stopLoop() {
        isPlaying = false
        currentSubBar = "1"
        currentBar = "1"
    }
    
    func incrementBar() {
        if isPlaying == false {
            currentBar == "1"
        } else {
            
            if currentBar == "4" {
                currentBar = "1"
                return
            }
            
            if currentBar == "3" {
                currentBar = "4"
            }
            
            if currentBar == "2" {
                currentBar = "3"
            }
            
            if currentBar == "1" {
                currentBar = "2"
            }
        }
        
    }
    
    func incrementSubBar() {
        if isPlaying == false {
            currentSubBar = "1"
        } else {
            
            if currentSubBar == "4" {
                currentSubBar = "1"
                return
            }
            
            if currentSubBar == "3" {
                currentSubBar = "4"
            }
            
            if currentSubBar == "2" {
                currentSubBar = "3"
            }
            
            if currentSubBar == "1" {
                currentSubBar = "2"
            }
        }
    }
    
    func playBeat11() {
        let drumItem = currentBeat?.beat11First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat11Second() {
        let drumItem = currentBeat?.beat11Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat11Half() {
        let drumItem = currentBeat?.beat11Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat12() {
        let drumItem = currentBeat?.beat12First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat12Second() {
        let drumItem = currentBeat?.beat12Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat12Half() {
        let drumItem = currentBeat?.beat12Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
        
    }
    
    func playBeat13() {
        let drumItem = currentBeat?.beat13First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat13Second() {
        let drumItem = currentBeat?.beat13Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat13Half() {
        let drumItem = currentBeat?.beat13Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat14() {
        let drumItem = currentBeat?.beat14First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
        
    }
    
    func playBeat14Second() {
        let drumItem = currentBeat?.beat14Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat14Half() {
        let drumItem = currentBeat?.beat14Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat21() {
        let drumItem = currentBeat?.beat21First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat21Second() {
        let drumItem = currentBeat?.beat21Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat21Half() {
        let drumItem = currentBeat?.beat21Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    
        
    }
    
    func playBeat22() {
        let drumItem = currentBeat?.beat22First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat22Second() {
        let drumItem = currentBeat?.beat22Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat22Half() {
        let drumItem = currentBeat?.beat22Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat23() {
        let drumItem = currentBeat?.beat23First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat23Second() {
        let drumItem = currentBeat?.beat23Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat23Half() {
        let drumItem = currentBeat?.beat23Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat24() {
        let drumItem = currentBeat?.beat24First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat24Second() {
        let drumItem = currentBeat?.beat24Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat24Half() {
        let drumItem = currentBeat?.beat24Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat31() {
        let drumItem = currentBeat?.beat31First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat31Second() {
        let drumItem = currentBeat?.beat31Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat31Half() {
        let drumItem = currentBeat?.beat31half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat32() {
        let drumItem = currentBeat?.beat32First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat32Second() {
        let drumItem = currentBeat?.beat32Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat32Half() {
        let drumItem = currentBeat?.beat32Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat33() {
        let drumItem = currentBeat?.beat33First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat33Second() {
        let drumItem = currentBeat?.beat33Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat33Half() {
        let drumItem = currentBeat?.beat33Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat34() {
        let drumItem = currentBeat?.beat34First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat34Second() {
        let drumItem = currentBeat?.beat34Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat34Half() {
        let drumItem = currentBeat?.beat34Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat41() {
        let drumItem = currentBeat?.beat41First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat41Second() {
        let drumItem = currentBeat?.beat41Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat41Half() {
        let drumItem = currentBeat?.beat41Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat42() {
        let drumItem = currentBeat?.beat42First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat42Second() {
        let drumItem = currentBeat?.beat42Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat42Half() {
        let drumItem = currentBeat?.beat42Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat43() {
        let drumItem = currentBeat?.beat43First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat43Second() {
        let drumItem = currentBeat?.beat43Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat43Half() {
        let drumItem = currentBeat?.beat43Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
    }
    
    func playBeat44() {
        let drumItem = currentBeat?.beat44First
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func playBeat44Second() {
        let drumItem = currentBeat?.beat44Second
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
        
    }
    
    func playBeat44Half() {
        let drumItem = currentBeat?.beat44Half
        
        if drumItem == instrumentStrings.kickString {
            KickPlayer.kick.playSound(sound: kickSound)
        } else if drumItem == instrumentStrings.snareString {
            SnarePlayer.snare.playSound(sound: snareSound)
        } else if drumItem == instrumentStrings.rimshotString {
            SnareRimShotPlayer.RimShot.playSound(sound: rimshotSound)
        } else if drumItem == instrumentStrings.sidestickString {
            SideStickPlayer.sidestick.playSound(sound: sidestickSound)
        } else if drumItem == instrumentStrings.hhCloseString {
            HighHatClosePlayer.HighHat.playSound(sound: HHCloseSound)
        } else if drumItem == instrumentStrings.hhOpenString {
            HighHatOpenPlayer.HighHat.playSound(sound: HHOpenSound)
        } else if drumItem == instrumentStrings.hiTomString {
            HighTomPlayer.HighTom.playSound(sound: hiTomSound)
        } else if drumItem == instrumentStrings.midTomString {
            MidTomPlayer.MidTom.playSound(sound: midTomSound)
        } else if drumItem == instrumentStrings.lowTomString {
            LowTomPlayer.LowTom.playSound(sound: lowTomSound)
        } else if drumItem == instrumentStrings.crashString {
            CrashPlayer.crash.playSound(sound: crashSound)
        } else if drumItem == instrumentStrings.rideString {
            RidePlayer.ride.playSound(sound: rideSound)
        } else if drumItem == instrumentStrings.random1String {
            RandomItem1Player.random.playSound(sound: random1Sound)
        } else if  drumItem == instrumentStrings.random2String {
            RandomItem2Player.ride.playSound(sound: random2Sound)
        }
        
    }
    
    func increaseBPM() {
        if BPM < 200 {
            BPM += 5
        }
    }
    
    func decreaseBPM() {
        if BPM > 80 {
            BPM -= 5
        }
    }
    
        
        
    }

struct BeatMenu_Previews: PreviewProvider {
    static var previews: some View {
        BeatMenu()
    }
}
