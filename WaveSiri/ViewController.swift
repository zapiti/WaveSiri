//
//  ViewController.swift
//  WaveSiri
//
//  Created by Nathan Ranghel on 17/02/19.
//  Copyright © 2019 Nathan Ranghel. All rights reserved.
//

import UIKit

class BackView: UIViewController {

    let wave : WaveView = {
        let wave =  WaveView()
        wave.waveColor = UIColor.blue
        wave.translatesAutoresizingMaskIntoConstraints = false
        return wave
    }()
    let wave2 : WaveView = {
        let wave =  WaveView()
        wave.numberOfWaves = 8
        wave.waveColor = UIColor.blue
        wave.alpha = 0.5
        wave.translatesAutoresizingMaskIntoConstraints = false
        return wave
    }()
    
    var timerAnimation: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        wave.backgroundColor = UIColor.white
        wave2.backgroundColor = UIColor.clear
        view.addSubview(wave)
        
        wave.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wave.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        wave.widthAnchor.constraint(equalToConstant: 400).isActive = true
        wave.heightAnchor.constraint(equalToConstant : 100).isActive = true
        
        
        view.addSubview(wave2)

        wave2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wave2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        wave2.widthAnchor.constraint(equalToConstant: 400).isActive = true
        wave2.heightAnchor.constraint(equalToConstant : 100).isActive = true
        
        // Do any additional setup after loading the view, typically from a nib.
        setupSpeachTimer()
    }
    internal func setupSpeachTimer() {
        if timerAnimation != nil {
            timerAnimation!.invalidate()
        }
        timerAnimation = Timer.scheduledTimer(timeInterval:  0.03, target: self, selector: #selector(setupAnimationMic), userInfo: nil, repeats: true)
        RunLoop.current.add(timerAnimation, forMode: RunLoop.Mode.common)
    }
    
    @objc func setupAnimationMic() {
        wave.updateWithLevel(CGFloat(tempWave))
        wave2.updateWithLevel(CGFloat(0.4))
        
    }
    var tempWave = 0.5
    @objc internal func refreshAudioView(_:Timer) {
        
//        if tempWave > 0.8 {
//            self.tempWave +=  -0.02
//        }
//        // Simply set the amplitude to whatever you need and the view will update itself.
//        if tempWave < -10 {
//            tempWave = 0.3
//        }
//        tempWave += 0.01
 
    }
    
    
}

