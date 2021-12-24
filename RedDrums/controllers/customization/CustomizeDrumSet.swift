//
//  CustomizeDrumSet.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import CoreData

enum DrumItem {
    case kick
    case snare
    case rimshot
    case sidestick
    case lowtom
    case midtom
    case hitom
    case crash
    case ride
    case hihatclose
    case hihatopen
    case random1
    case random2
}

struct CustomizeDrumSet: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var context
    @State private var showingSelectionScreen = false
    @State private var showingError = false
    
    @State private var ShowingNewSetAlert = true
    @State private var newSetName = "enter name"
    
    @State private var set: DrumKit?
    
    @State var currentDrumItem: DrumItem = .kick
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                HStack {
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .kick
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Kick").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .snare
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("Snare").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                                
                            }
                        }
                        
                        Spacer()
                        
                    }
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .lowtom
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Low Tom").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                            }
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).onTapGesture {
                                currentDrumItem = .rimshot
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            VStack {
                                Text("Rimshot").foregroundColor(.white).font(.system(size: 14))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 14))
                            }
                       
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .midtom
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Mid Tom").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .hitom
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            
                            VStack {
                                Text("Hi Tom").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .sidestick
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Side Stick").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .crash
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Crash").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .random1
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Random 1").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .random2
                                self.showingSelectionScreen = true
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Random 2").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                            }
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.green).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                                HapticsManager.shared.hapticShakeIntense()
                            }
                            
                            VStack {
                                Text("Save").foregroundColor(.white).font(.system(size: 13))
                                Text("& Exit").foregroundColor(.white).font(.system(size: 13))
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .ride
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("Ride").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .hihatopen
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("HHO").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                           
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).onTapGesture {
                                currentDrumItem = .hihatclose
                                HapticsManager.shared.hapticShakeIntense()
                                self.showingSelectionScreen = true
                            }
                            
                            VStack {
                                Text("HHC").foregroundColor(.white).font(.system(size: 13))
                                Text("Sounds").foregroundColor(.white).font(.system(size: 13))
                                
                            }
                            
                        }
                        
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    
                    NewSetNameAlert(isShown: $ShowingNewSetAlert, text: $newSetName, onDone: {
                        name in
                        createNewSet(name: name)
                    
                    }, onCancel: {
                        self.presentationMode.wrappedValue.dismiss()
                    }).opacity(ShowingNewSetAlert ? 1 : 0).environment(\.managedObjectContext, context).clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    ErrorSaving(isShown: $showingError, onCancel: {
                        presentationMode.wrappedValue.dismiss()
                    }).opacity(showingError ? 1 : 0)
                    
                    Spacer()
                    
                }
                
                
            }.background(Color.black).sheet(isPresented: $showingSelectionScreen) {
                ChangeDrumItem(drumItem: $currentDrumItem, drumSet: set!)
                
            }
        }
        
    }
    
    
    func createNewSet(name: String) {
        let newSet = DrumKit(context: self.context)
        newSet.name = name
        newSet.id = UUID()
        
        do {
            try self.context.save()
        } catch {
            showingError = true
        }
        
        self.set = newSet
        
    }
    
    func prepareHaptics() {
        HapticsManager.shared.prepareHaptics()
    }
    
//    private func playKick() {
//        KickPlayer.kick.playSound()
//    }
//
//    private func playHighHatClose() {
//        HighHatClosePlayer.HighHat.playSound()
//    }
//
//    private func playSnare() {
//        SnarePlayer.snare.playSound()
//    }
//
//    private func playRimshot() {
//        SnareRimShotPlayer.RimShot.playSound()
//    }
//
//    private func playRide() {
//        RidePlayer.ride.playSound()
//    }
//
//    private func playCrash() {
//        CrashPlayer.crash.playSound()
//    }
//
//    private func playHighHatOpen() {
//        HighHatOpenPlayer.HighHat.playSound()
//    }
//
//    private func playLowTom() {
//        LowTomPlayer.LowTom.playSound()
//    }
//
//    private func playMidTom() {
//        MidTomPlayer.MidTom.playSound()
//    }
//
//    private func playHighTom() {
//        HighTomPlayer.HighTom.playSound()
//    }
//
//    private func playSideStick() {
//        SideStickPlayer.sidestick.playSound()
//    }
}


