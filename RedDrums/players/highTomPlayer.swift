//
//  highTomPlayer.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import Foundation
import AVFoundation

class HighTomPlayer: NSObject, AVAudioPlayerDelegate {
    static let HighTom = HighTomPlayer()
    
    var player: AVAudioPlayer?
    
    func playSound(sound: String) {
        do {
            var musicUrl: String = ""
            
            musicUrl = Bundle.main.path(forResource: sound, ofType: "mp3")!
            
            
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicUrl))
            
            player?.delegate = self
            
            guard var player = player else {
                return
            }
            
            player.play()
            
        } catch {
            print("unable to play music")
        }
    }
}
