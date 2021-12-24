//
//  HomeViewController.swift
//  RedDrums
//
//  Created by Jason bartley on 12/6/21.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController, UINavigationControllerDelegate {
    
    let screenSize = UIScreen.main.bounds
    
    let redDrumsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RedDrumsBWCropped")
        imageView.backgroundColor = .purple
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let lightRedCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 120
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let CustomizeCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 110
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let LoopsCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 110
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let freeLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = "Free"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let playLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = "Play"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let customizeDrumsLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = "Customize"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loopsDrumsLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.text = "Loops"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var isDrumTitleWhite: Bool = false
    
    private var didSelectAnItem: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        HapticsManager.shared.prepareHaptics()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let playDrumsHeightAndWidth = screenSize.height * 0.6
        let loopsHeightAndWidth = screenSize.height * 0.45
        
        lightRedCircleImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        lightRedCircleImageView.heightAnchor.constraint(equalToConstant: playDrumsHeightAndWidth).isActive = true
        lightRedCircleImageView.widthAnchor.constraint(equalToConstant: playDrumsHeightAndWidth).isActive = true
        lightRedCircleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10).isActive = true
        
        redDrumsImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: (-playDrumsHeightAndWidth)).isActive = true
        redDrumsImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        redDrumsImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        redDrumsImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        
        lightRedCircleImageView.layer.cornerRadius = playDrumsHeightAndWidth/2

        CustomizeCircleImageView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: (-loopsHeightAndWidth/2) ).isActive = true
        CustomizeCircleImageView.heightAnchor.constraint(equalToConstant: loopsHeightAndWidth).isActive = true
        CustomizeCircleImageView.widthAnchor.constraint(equalToConstant: loopsHeightAndWidth).isActive = true
        CustomizeCircleImageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: playDrumsHeightAndWidth - 20).isActive = true

        CustomizeCircleImageView.layer.cornerRadius = loopsHeightAndWidth/2


        LoopsCircleImageView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: (loopsHeightAndWidth/2) + 10).isActive = true
        LoopsCircleImageView.heightAnchor.constraint(equalToConstant: loopsHeightAndWidth).isActive = true
        LoopsCircleImageView.widthAnchor.constraint(equalToConstant: loopsHeightAndWidth).isActive = true
        LoopsCircleImageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: playDrumsHeightAndWidth - 20).isActive = true

        LoopsCircleImageView.layer.cornerRadius = loopsHeightAndWidth/2
        
        freeLabel.centerXAnchor.constraint(equalTo: lightRedCircleImageView.centerXAnchor, constant: 0).isActive = true
        freeLabel.centerYAnchor.constraint(equalTo: lightRedCircleImageView.centerYAnchor, constant: -17).isActive = true
        freeLabel.widthAnchor.constraint(equalToConstant: 77).isActive = true
        freeLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
        
        playLabel.centerXAnchor.constraint(equalTo: lightRedCircleImageView.centerXAnchor, constant: 0).isActive = true
        playLabel.centerYAnchor.constraint(equalTo: lightRedCircleImageView.centerYAnchor, constant: 17).isActive = true
        playLabel.widthAnchor.constraint(equalToConstant: 77).isActive = true
        playLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        customizeDrumsLabel.centerXAnchor.constraint(equalTo: CustomizeCircleImageView.centerXAnchor, constant: 0).isActive = true
        customizeDrumsLabel.centerYAnchor.constraint(equalTo: CustomizeCircleImageView.centerYAnchor, constant: 0).isActive = true
        customizeDrumsLabel.widthAnchor.constraint(equalToConstant: 123).isActive = true
        customizeDrumsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loopsDrumsLabel.centerXAnchor.constraint(equalTo: LoopsCircleImageView.centerXAnchor, constant: 0).isActive = true
        loopsDrumsLabel.centerYAnchor.constraint(equalTo: LoopsCircleImageView.centerYAnchor, constant: 0).isActive = true
        loopsDrumsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loopsDrumsLabel.widthAnchor.constraint(equalToConstant: 97).isActive = true
        

    }
    
    private func initialSetUp() {
        view.backgroundColor = .black
        view.addSubview(redDrumsImageView)
        view.addSubview(lightRedCircleImageView)
        view.addSubview(CustomizeCircleImageView)
        view.addSubview(LoopsCircleImageView)
        view.addSubview(playLabel)
        view.addSubview(freeLabel)
        view.addSubview(customizeDrumsLabel)
        view.addSubview(loopsDrumsLabel)
        
        let playDrumTap = UITapGestureRecognizer(target: self, action: #selector(didTapPlay))
        let playDrumCircleTap = UITapGestureRecognizer(target: self, action: #selector(didTapPlay))
        let customizeDrumsTap = UITapGestureRecognizer(target: self, action: #selector(didTapCustomize))
        let customizeDrumsCircleTap = UITapGestureRecognizer(target: self, action: #selector(didTapCustomize))
        let loopsTap = UITapGestureRecognizer(target: self, action: #selector(didTapLoops))
        let loopCircleTap = UITapGestureRecognizer(target: self, action: #selector(didTapLoops))
        
        playLabel.addGestureRecognizer(playDrumTap)
        lightRedCircleImageView.addGestureRecognizer(playDrumCircleTap)
        customizeDrumsLabel.addGestureRecognizer(customizeDrumsTap)
        CustomizeCircleImageView.addGestureRecognizer(customizeDrumsCircleTap)
        loopsDrumsLabel.addGestureRecognizer(loopsTap)
        LoopsCircleImageView.addGestureRecognizer(loopCircleTap)
        
    }
    
    @objc func didTapPlay() {
        KickPlayer.kick.playSound(sound: "kick1")
        HapticsManager.shared.hapticShakeIntense()
        let vc = UIHostingController(rootView: SelectDrumSetMenu())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapCustomize() {
        SnarePlayer.snare.playSound(sound: "snare1")
        HapticsManager.shared.hapticShakeIntense()
        let vc = UIHostingController(rootView: CustomizationMenu())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapLoops() {
        CrashPlayer.crash.playSound(sound: "crash1")
        HapticsManager.shared.hapticShakeIntense()
        let vc = UIHostingController(rootView: BeatMenu())
        navigationController?.pushViewController(vc, animated: true)
    }

}

