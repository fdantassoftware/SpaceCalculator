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
    // Enum to deal with 4 Operation
    
    enum Operation: String{
        case div = "/"
        case multi = "*"
        case add = "+"
        case sub = "-"
        case empty = "Empty"
    }
    
    
    // Properties and sound set up
    @IBOutlet weak var outputLabel: UILabel!
    var currentNumber = ""
    var leftNumber = ""
    var rightNumber = ""
    var currentOPeration: Operation = Operation.empty
    var result = ""
    var btnSound: AVAudioPlayer!
    var ambSound: AVAudioPlayer!
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        let path2 = NSBundle.mainBundle().pathForResource("Space", ofType: "wav")
        let sound2URL = NSURL(fileURLWithPath: path2!)
        
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
            try ambSound = AVAudioPlayer(contentsOfURL: sound2URL)
        
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        ambSound.play()
    
    }

   

    @IBAction func buttonPressed(btn: UIButton!) {
        currentNumber += "\(btn.tag)"
        outputLabel.text = currentNumber
        playSound()
        ambSound.stop()
        
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
        processOPeration(currentOPeration)
        
    }

    
    
    
    
    @IBAction func onMinusPressed(sender: AnyObject) {
        processOPeration(Operation.sub)
        
        
        
        
        
    }
   
    
    @IBAction func clearCalc(sender: AnyObject) {
        outputLabel.text = "0"
        currentNumber = ""
        leftNumber = ""
        rightNumber = ""
        currentOPeration = Operation.empty
        result = ""
        
    }


    func processOPeration(op: Operation) {
       if currentOPeration != Operation.empty {
            
            if currentNumber != "" {
                rightNumber = currentNumber
                currentNumber = ""
                
                if currentOPeration == Operation.multi {
                    result = "\(Double(leftNumber)! * Double(rightNumber)!)"
                
                }else if currentOPeration == Operation.div {
                    result = "\(Double(leftNumber)! / Double(rightNumber)!)"
                    
                
                }else if currentOPeration == Operation.add {
                    result = "\(Double(leftNumber)! + Double(rightNumber)!)"
                
                
                }else if currentOPeration == Operation.sub {
                    result = "\(Double(leftNumber)! - Double(rightNumber)!)"
                   
                    
                }
                
                
                leftNumber = result
                outputLabel.text = result
            }
            currentOPeration = op
           
                
                
                
            
            
        }else {
            leftNumber = currentNumber
            currentNumber = ""
            currentOPeration = op
        }
        
        
        
        
        
        playSound()
        
    }


    func playSound() {
        if btnSound.playing  {
            btnSound.stop()
            
        }
        
        btnSound.play()
    
    
    }

   



}

