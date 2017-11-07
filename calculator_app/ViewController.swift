//
//  ViewController.swift
//  calculator_app
//
//  Created by Mario Naranjo Leiva on 11/7/17.
//  Copyright © 2017 Mario Naranjo Leiva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Label to show the display.
    @IBOutlet weak var display: UILabel!
    
    //  Flag to indicate if user is just typing.
    var isUsertyping = false
    
    /**
     *  Event to select a new digit. It can be a operation symbol as well.
     **/
    @IBAction func touchDigit(_ sender: UIButton)
    {
        let digit = sender.currentTitle!
        
        if isUsertyping
        {
            let currentlyDisplayed = display.text!
            display.text = currentlyDisplayed + digit
        }
        else
        {
            display.text = digit
            isUsertyping = true
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        display.text = ""
    }
    
    

}

