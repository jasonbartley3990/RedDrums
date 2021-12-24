//
//  snarePlayer.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import Foundation
import AVFoundation

class SnarePlayer: NSObject, AVAudioPlayerDelegate {
    static let snare = SnarePlayer()
    
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    var player3: AVAudioPlayer?
    var player4: AVAudioPlayer?
    var player5: AVAudioPlayer?
    
    func playSound(sound: String) {
        do {
            var musicUrl: String = ""
            
            musicUrl = Bundle.main.path(forResource: sound, ofType: "mp3")!
            
            
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            if player?.isPlaying == true {
                if player2?.isPlaying == true {
                    if player3?.isPlaying == true {
                        if player4?.isPlaying == true {
                            player5 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicUrl))
                            play(audioPlayer: player5)
                        } else {
                            player4 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicUrl))
                            play(audioPlayer: player4)
                        }
                    } else {
                        player3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicUrl))
                        play(audioPlayer: player3)
                    }
                } else {
                    player2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicUrl))
                    play(audioPlayer: player2)
                }
            } else {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicUrl))
                play(audioPlayer: player)
            }
            
        } catch {
            print("unable to play music")
        }
    }
    
    func play(audioPlayer: AVAudioPlayer?) {
        
        audioPlayer?.delegate = self
        
        guard var player = audioPlayer else {
            return
        }
        
        player.play()
        
    }}
