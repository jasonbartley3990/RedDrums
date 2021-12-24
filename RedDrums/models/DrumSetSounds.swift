//
//  DrumSetSounds.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import Foundation
class DrumSetSounds: ObservableObject {
    static let Sounds = DrumSetSounds()
    
    //sound files
    
    public let KickSounds = ["kick1", "kick2", "kick3", "kick4", "kick5", "kick6", "kick7", "kick8"]
    public let SnareSounds = ["snare1", "snare2", "snare3", "snare4", "snare5", "snare6", "snare7", "snare8", "snare9", ]
    public let RimshotSounds = ["rimshot1", "rimshot2", "rimshot3", "rimshot4", "rimshot5"]
    public let SidestickSounds = ["sidestick1", "sidestick2", "sidestick3", "sidestick4", "sidestick5", "sidestick6"]
    public let LowTomSounds = ["lowTom1", "lowTom2", "lowTom3", "lowTom4", "lowTom5", "lowTom6", "lowTom7"]
    public let MidTomSounds = ["midTom1", "midTom2", "midTom3", "midTom4", "midTom5", "midTom6", "midTom7", "midTom8", "midTom9"]
    public let HiTomSounds = ["hiTom1", "hiTom2", "hiTom4", "hiTom5", "hiTom6"]
    public let RideSounds = ["ride1", "ride2", "ride3", "ride4"]
    public let CrashSounds = ["crash1", "crash2", "crash3", "crash5"]
    public let HiHatOpenSounds = ["hiHatOpen1", "hiHatOpen2", "hiHatOpen4", "hiHatOpen5", "hiHatOpen6", "hiHatOpen7"]
    public let HiHatCloseSounds = ["highHatClosed1", "hiHatClose2", "hiHatClose3", "hiHatClose4"]
    public let otherSounds = ["shaker1, cowbell1"]
    
    

    // sound names
    
    public let kickNames = ["Standard Kick", "British Kick", "Basement Kick", "Deep Kick", "Distorted Kick", "East Coast Kick", "Club Kick", "Texas Kick"]
    public let snareNames = ["Standard snare", "Garage Snare", "East Coast Snare", "Down Town Snare", "Vintage Snare", "Distorted Snare", "Metallic Snare", "Toy Snare", "Techno Snare"]
    public let rimshotNames = ["Standard Rimshot", "Funky Rimshot", "Warped Rimshot", "Garbage Rimshot", "East Coast Rimshot"]
    public let sidestickNames = ["Standard Sidestick", "Cedar Sidestick", "Pine Sidestick", "Vintage Sidestick", "Retro Sidestick", "Redwood Sidestick"]
    public let lowTomNames = ["Standard Low Tom", "Garage Low Tom", "Jungle Low Tom", "East Coast Low Tom", "Club Low Tom", "Distorted Low Tom", "Vintage Low Tom"]
    public let midTomNames = ["Standard Mid Tom", "East Coast Mid Tom", "Garage Mid Tom", "Retro Mid Tom", "West Coast Mid Tom", "Indie Mid Tom", "Warped Mid Tom", "Faded Mid Tom"]
    public let hiTomNames = ["Standard Hi Tom", "British Hi Tom", "Deep Hi Tom", "Indie Hi East Coast Hi Tom"]
    public let hiHatClosedNames = ["Standard Hi Hat Closed", "Garage Hi Hat Closed", "Distorted Hi Hat Closed", "Retro Hi Hat Closed"]
    public let hiHatOpenNames = ["Standrd Hi Hat Open", "California HI Hat Open", "Fuzzy Hi Hat Open", "Distorted Hi Hat Open", "Hip Hop Hi Hat Open", "Retro Hi Hat Open"]
    public let rideNames = ["Standard Ride", "Jazzy Ride", "Obscure Ride", "Faded Ride"]
    public let crashNames = ["Standard Crash", "British Crash", "East Coast Crash", "Distorted Crash"]
    public let otherNames = ["shaker", "cowbell"]
    
    
    
    
    public var currentKick = 0
    private var currentSnare = 0
    private var currentRimshot = 0
    private var currentSidestack = 0
    private var currentLowTom = 0
    private var currentMidTom = 0
    private var currentHiTom = 0
    private var currentRide = 0
    private var currentCrash = 0
    private var currentHiHatOpen = 0
    private var currentHiHatCLose = 0
    private var randomItem1 = 0
    private var randomItem2 = 1
    
}
