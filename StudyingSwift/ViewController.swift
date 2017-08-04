//
//  ViewController.swift
//  StudyingSwift
//
//  Created by Kalwitalo Ibiapina on 03/08/17.
//  Copyright © 2017 Kalwitalo Ibiapina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayTextField: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    private var displayValue : Double {
        get {
            return Double(displayTextField.text!)!
        }
        set {
            displayTextField.text = String(newValue)
        }
        
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func keyPressed(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if userIsInTheMiddleOfTyping {
                if let textCurrentlyInDisplay = displayTextField.text {
                    displayTextField.text = textCurrentlyInDisplay + digit
                }
            } else {
                displayTextField.text = digit
                userIsInTheMiddleOfTyping = true
            }
        }
    }
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }

}

