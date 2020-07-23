//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer!
    var soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    var selectedSoundFileName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    @IBAction func notePressed(_ sender: UIButton) {
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        selectedSoundFileName = soundArray[sender.tag - 1]
        playSound()
        
        
        
        
    }
    func playSound(){
        
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
               
               do{
                   audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
                   
               }
               catch{
                   print("error")
               }
               audioPlayer.play()
               
        
    }
    func reset(_ sender: UIButton){
        sleep(1)
        sender.alpha = 1
    }
    
    
  

}

