//
//  DrumSet.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import SwiftUI
import AVFoundation

struct DrumSet: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var animationAmount = 1.0
    
    public var isStandard = true
    public var set: DrumKit?
    
    @State private var kickShouldAnimate = false
    @State private var snareShouldAnimate = false
    @State private var rimshotShouldAnimate = false
    @State private var sidestickShouldAnimate = false
    @State private var lowtomShouldAnimate = false
    @State private var midtomShouldAnimate = false
    @State private var hitomShouldAnimate = false
    @State private var rideShouldAnimate = false
    @State private var crashShouldAnimate = false
    @State private var hihatOpenShouldAnimate = false
    @State private var hihatCloseShouldAnimate = false
    @State private var random1ShouldAnimate = false
    @State private var random2ShouldAnimate = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                
                HStack {
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(kickShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).scaleEffect(kickShouldAnimate ? 0.85 : 1).onTapGesture {
                                playKick()
                                HapticsManager.shared.hapticShakeIntense()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    kickShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.kickShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Kick").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(
                                snareShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).scaleEffect(snareShouldAnimate ? 0.85 : 1).onTapGesture {
                                playSnare()
                                HapticsManager.shared.hapticShakeIntense()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    snareShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.snareShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Snare").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                    }
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(lowtomShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).scaleEffect(lowtomShouldAnimate ? 0.85 : 1).onTapGesture {
                                playLowTom()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    lowtomShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.lowtomShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Low Tom").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(rimshotShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.45) - 5, height: (geo.size.height * 0.45) - 5, alignment: .center).scaleEffect(rimshotShouldAnimate ? 0.85 : 1).onTapGesture {
                                playRimshot()
                                HapticsManager.shared.hapticShakeIntense()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    rimshotShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.rimshotShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Rim Shot").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(midtomShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).scaleEffect(midtomShouldAnimate ? 0.85 : 1).onTapGesture {
                                playMidTom()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    midtomShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.midtomShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Mid Tom").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(hitomShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).scaleEffect(hitomShouldAnimate ? 0.85 : 1).onTapGesture {
                                playHighTom()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    hitomShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.hitomShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Hi Tom").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(sidestickShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).scaleEffect(sidestickShouldAnimate ? 0.85 : 1).onTapGesture {
                                playSideStick()
                                HapticsManager.shared.hapticShakeIntense()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    sidestickShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.sidestickShouldAnimate.toggle()
                                    }
                                }
                                
                            }
                            
                            Text("Side Stick").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                    }
                    
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Circle().fill(crashShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).scaleEffect(crashShouldAnimate ? 0.85 : 1).onTapGesture {
                                playCrash()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    crashShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.crashShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("Crash").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(random1ShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).scaleEffect(random1ShouldAnimate ? 0.85 : 1).onTapGesture {
                                playRandom1()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    random1ShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.random1ShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text(isStandard ? "Shaker" : "Other").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(random2ShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.33) - 12, height: (geo.size.height * 0.33) - 12, alignment: .center).scaleEffect(random2ShouldAnimate ? 0.85 : 1).onTapGesture {
                                playRandom2()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    random2ShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.random2ShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text(isStandard ? "Cowbell" : "Other").foregroundColor(.white)
                       
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
                            Circle().fill(rideShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).scaleEffect(rideShouldAnimate ? 0.85 : 1).onTapGesture {
                                playRide()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    rideShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.rideShouldAnimate.toggle()
                                    }
                                }
                                
                            }
                            
                            Text("Ride").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(hihatOpenShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).scaleEffect(hihatOpenShouldAnimate ? 0.85 : 1).onTapGesture {
                                playHighHatOpen()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    hihatOpenShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.hihatOpenShouldAnimate.toggle()
                                    }
                                }
                            }
                            
                            Text("HH Open").foregroundColor(.white).font(.system(size: 15))
                       
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle().fill(hihatCloseShouldAnimate ? Color.white : Color.red).frame(width: (geo.size.height * 0.25) - 12, height: (geo.size.height * 0.25) - 12, alignment: .center).scaleEffect(hihatCloseShouldAnimate ? 0.85 : 1).onTapGesture {
                                if HighHatOpenPlayer.HighHat.isPlaying() == true {
                                    HighHatOpenPlayer.HighHat.stopPlaying()
                                }
                                playHighHatClose()
                                HapticsManager.shared.hapticShakeMedium()
                                let animation = Animation.easeInOut(duration: 0.1).repeatCount(1, autoreverses: true)
                                withAnimation(animation) {
                                    hihatCloseShouldAnimate.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(animation) {
                                        self.hihatCloseShouldAnimate.toggle()
                                    }
                                }
                                
                            }
                            
                            Text("HH Close").foregroundColor(.white)
                       
                        }
                        
                        Spacer()
                    }
                }.background(Color.black).onAppear(perform: {
                    prepareHaptics()
                })
                .onAppear(perform: playCrash)
            }
            
           
            
        }
            
    }
    
    private func playKick() {
        if isStandard {
            KickPlayer.kick.playSound(sound: "kick1")
        } else {
            let kick = set!.kick
            let intKick = Int(kick)
            print(intKick)
            KickPlayer.kick.playSound(sound: DrumSetSounds.Sounds.KickSounds[intKick])
           
        }
        
    }
    
    private func playHighHatClose() {
        if isStandard {
            HighHatClosePlayer.HighHat.playSound(sound: "highHatClosed1")
        } else {
            let HHC = set!.hihatclosed
            let intHHC = Int(HHC)
            HighHatClosePlayer.HighHat.playSound(sound: DrumSetSounds.Sounds.HiHatCloseSounds[intHHC])
            
        }
        
    }
    
    private func playSnare() {
        if isStandard {
            SnarePlayer.snare.playSound(sound: "snare1")
        } else {
            let snare = set!.snare
            let intSnare = Int(snare)
            SnarePlayer.snare.playSound(sound: DrumSetSounds.Sounds.SnareSounds[intSnare])
        }
        
    }
    
    private func playRimshot() {
        if isStandard {
            SnareRimShotPlayer.RimShot.playSound(sound: "rimshot1")
        } else {
            let rimshot = set!.rimshot
            let intRimShot = Int(rimshot)
            SnareRimShotPlayer.RimShot.playSound(sound: DrumSetSounds.Sounds.RimshotSounds[intRimShot])
        }
    }
    
    private func playRide() {
        if isStandard {
            RidePlayer.ride.playSound(sound: "ride1")
        } else {
            let ride = set!.ride
            let intRide = Int(ride)
            RidePlayer.ride.playSound(sound: DrumSetSounds.Sounds.RideSounds[intRide])
        }
    }
    
    private func playCrash() {
        if isStandard {
            CrashPlayer.crash.playSound(sound: "crash1")
        } else {
            let crash = set!.crash
            let intCrash = Int(crash)
            CrashPlayer.crash.playSound(sound: DrumSetSounds.Sounds.CrashSounds[intCrash])
        }
        
    }
    
    private func playHighHatOpen() {
        if isStandard {
            HighHatOpenPlayer.HighHat.playSound(sound: "hiHatOpen1")
        } else {
            let highHatOpen = set!.hihatopen
            let intHHO = Int(highHatOpen)
            HighHatOpenPlayer.HighHat.playSound(sound: DrumSetSounds.Sounds.HiHatOpenSounds[intHHO])
            
        }
        
    }
    
    private func playLowTom() {
        if isStandard {
            LowTomPlayer.LowTom.playSound(sound: "lowTom1")
        } else {
            let lowTom = set!.lowtom
            let intLowTom = Int(lowTom)
            LowTomPlayer.LowTom.playSound(sound: DrumSetSounds.Sounds.LowTomSounds[intLowTom])
        }
        
    }
    
    private func playMidTom() {
        if isStandard {
            MidTomPlayer.MidTom.playSound(sound: "midTom1")
        } else {
            let midTom = set!.midtom
            let intMidTom = Int(midTom)
            MidTomPlayer.MidTom.playSound(sound: DrumSetSounds.Sounds.MidTomSounds[intMidTom])
        }
    }
    
    private func playHighTom() {
        if isStandard {
            HighTomPlayer.HighTom.playSound(sound: "hiTom1")
        } else {
            let hiTom = set!.hitom
            let intHiTom = Int(hiTom)
            HighTomPlayer.HighTom.playSound(sound: DrumSetSounds.Sounds.HiTomSounds[intHiTom])
        }
       
    }
    
    private func playSideStick() {
        if isStandard {
            SideStickPlayer.sidestick.playSound(sound: "sidestick1")
        } else {
            let sidestick = set!.sidestick
            let intSideStick = Int(sidestick)
            SideStickPlayer.sidestick.playSound(sound: DrumSetSounds.Sounds.SidestickSounds[intSideStick])
        }
        
    }
    
    private func playRandom1() {
        if isStandard {
            RandomItem1Player.random.playSound(sound: "shaker1")
        } else {
            let random = set!.randomItem1
            let intRandom = Int(random)
            RandomItem1Player.random.playSound(sound: DrumSetSounds.Sounds.otherSounds[intRandom])
        }
    }
    
    private func playRandom2() {
        if isStandard {
            RandomItem1Player.random.playSound(sound: "cowbell1")
        } else {
            let random = set!.randomItem2
            let intRandom = Int(random)
            RandomItem1Player.random.playSound(sound: DrumSetSounds.Sounds.otherSounds[intRandom])
        }
    }
    
    private func prepareHaptics() {
        HapticsManager.shared.prepareHaptics()
    }
}


