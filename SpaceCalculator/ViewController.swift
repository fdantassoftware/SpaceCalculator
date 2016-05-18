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
    enum Operation: String{
        case div = "/"
        case multi = "*"
        case add = "+"
        case sub = "-"
        case empty = "Empty"
    }
    @IBOutlet weak var outputLabel: UILabel!
    var currentNumber = ""
    var leftNumber = ""
    var rightNumber = ""
    var currentOPeration: Operation = Operation.empty
    
    var btnSound: AVAudioPlayer!
    override func viewDidLoad() {
        outputLabel.text = ""
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
        currentNumber += "\(btn.tag)"
        outputLabel.text = currentNumber
        playSound()
        
    }


    @IBAction func onDivPressed(sender: AnyObject) {
        processOPeration(Operation.div)
        
        
    }


    @IBAction func onMultiPressed(sender: AnyObject) {
        processOPeration(Operation.multi)
    }


    @IBAction func onAddPressed(sender: AnyObject) {
        processOPeration(Operation.add)
    }

    @IBAction func onEqualPressed(sender: AnyObject) {
        processOPeration(Operation.sub)
    }



    func processOPeration(op: Operation) {
        if currentOPeration != Operation.empty{
            // math
            
        }else{
            leftNumber = currentNumber
            currentNumber = ""
            currentOPeration = op
        }
        
        
        
        
        
        playSound()
        
    }


    func playSound(){
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    
    
    }





}

