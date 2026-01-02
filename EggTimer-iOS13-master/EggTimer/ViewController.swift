//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    var softCounter = 0
//    var hardCounter = 0
//    var mediumCounter = 0
//    var secondsRemaining = 60
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardNessSelected(_ sender: UIButton) {
        
        print("\(sender.currentTitle ?? "")")
        
        timer.invalidate()
        
        let heardness = sender.currentTitle!
        totalTime = eggTimes[heardness]!
        
        
        progressView.progress = 0.0
        secondsPassed = 0
        titleLabel.text = heardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        if sender.currentTitle == "Soft" {
//            
//           
//            print((timeDictionary["Soft"] ?? 0) /** 60*/)
//            softCounter = (timeDictionary["Soft"] ?? 0) /** 60*/
//            print(softCounter)
//            
//            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                if self.softCounter > 0 {
//                    print("\(self.softCounter) seconds")
//                    self.softCounter -= 1
//                    self.progressView.progress = Float(self.softCounter)
//                } else {
//                    self.titleLabel.text = "Done"
//                }
//            }
//        } else if sender.currentTitle == "Medium" {
//            
//            mediumCounter = (timeDictionary["Medium"] ?? 0) * 60
//            print(mediumCounter)
//            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                if self.mediumCounter > 0 {
//                    print("\(self.mediumCounter) seconds")
//                    self.mediumCounter -= 1
//                }
//            }
//            print(timeDictionary["Medium"] ?? 0)
//        } else if sender.currentTitle == "Hard" {
//            
//            hardCounter = (timeDictionary["Medium"] ?? 0) * 60
//            print(hardCounter)
//            
//            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                if self.hardCounter > 0 {
//                    print("\(self.hardCounter) seconds")
//                    self.hardCounter -= 1
//                }
//            }
//            print(timeDictionary["Hard"] ?? 0)
//        }
        
    }
    @objc func updateTimer() {
        
        print("secondsPassed \(Float(secondsPassed))")
        print("totalTime \(totalTime)")
        
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            playSound()
            timer.invalidate()
            titleLabel.text = "Done"
            //player.stop()
            
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")!
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
       
    
}
