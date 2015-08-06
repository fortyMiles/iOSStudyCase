//
//  ViewController.swift
//  ChineseAnimals
//
//  Created by 高民权 on 8/5/15.
//  Copyright (c) 2015 Gaominquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var yearOfBirth: UITextField!
    
    @IBOutlet weak var aminalImage: UIImageView!
    
    let offSet = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        yearOfBirth.resignFirstResponder()
        println("touch ended")
    }
    
    @IBAction func submit(sender: AnyObject) {
        
        yearOfBirth.resignFirstResponder()
        
        if let year = yearOfBirth.text.toInt(){
            var imageNumber = (year - offSet) % 12
            aminalImage.image = UIImage(named: String(imageNumber % 3))
        }else{
            //
        }
    }
    
}

