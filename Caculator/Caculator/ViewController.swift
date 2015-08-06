//
//  ViewController.swift
//  Caculator
//
//  Created by 高民权 on 7/20/15.
//  Copyright (c) 2015 Gaominquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    //automatically unwrap it so that you don't have to put exclamation every time.
    
    var userIsInTheMiddleOfTypingANumber = false
    
    let brain = CaculatorBrain()
    
    @IBAction func addDigit(sender: UIButton){
        let digit = sender.currentTitle!
        //display.text = display.text! + digit
        
        if userIsInTheMiddleOfTypingANumber{
            display.text =  display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        println(" digit = \(digit)")
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        
        if let operations = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            }else{
                displayValue = 0
            }
        }
        
    }

}

