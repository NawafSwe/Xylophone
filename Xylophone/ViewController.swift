//
//  ViewController.swift
//  Xylophone
//
//  Created by Nawaf B AL sharqi on 27/06/2020.
//  Copyright © 2020 ALL rights reserved.
//

import UIKit
// to play sounds we need to import AVFoundation is used also to interact with the hardware of the phone,MacOs ect.. 
import AVFoundation



class ViewController: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // this function is to use it for any button in the ui
    @IBAction func  buttonPressed(_ sender: UIButton) {
        //playing with the opacity
        sender.alpha = 0.5
        let fileName = getFileName(sender.tag)
        playSound(fileName)
        // using async concept to get the opacity get back after the press
       DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
       //Bring's sender's opacity back up to fully opaque.
       sender.alpha = 1.0
       }
         
    }
    
    func playSound(_ fileName:String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
  
    
    // this function to determine the file name based on the tag that we give each button and this is the way to create a func that return string by -> returnType also to give the func a param we put (_ param: type) -> returnType
    func getFileName(_ tag: Int)-> String{
        switch  tag {
        case 0:
            return "C"
            
        case 1:
            return "D"
        case 2:
            return "E"
        case 3:
            return "F"
        case 4:
            return "G"
        case 5:
            return "A"
        case 6:
            return "B"
            
        default:
            return ""
        }
        
    }
    
    
}

