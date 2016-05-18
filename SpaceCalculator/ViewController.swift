//
//  ViewController.swift
//  SpaceCalculator
//
//  Created by Fabio Dantas on 18/05/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    var btnSound: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        
    }

   

    @IBAction func buttonPressed(btn: UIButton!){
        btnSound.play()
        
    }
}

