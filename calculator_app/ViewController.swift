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
    private var isUsertyping = false
    
    // The view model.
    private var calculatorcCore = CalculatorModel()
    
    
    // ============ METHODS ================================
    
    var getValue: Double
    {
        get {return Double(display.text!)!} // ! = este valor no debe ser nulo; lanzaría una excepción en caso contrario.
        set{ display.text = String(newValue)}
    }
    
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
    
    /**
     * Perform an operation over operands.
     **/
   
    @IBAction func performOperation(_ sender: UIButton)
    {
        if isUsertyping
        {
            calculatorcCore.setOperand(getValue)
            isUsertyping = false
        }
        if let mathsymbol = sender.currentTitle
        {
            calculatorcCore.performOperation(mathsymbol)
        }
        if let result = calculatorcCore.result
        {
            getValue = result
        }
    }
    
    /**
     * Reset the calculator screen.
     **/
 
    @IBAction func reset(_ sender: UIButton) {
        display.text = "0"
    }
    
    

}

