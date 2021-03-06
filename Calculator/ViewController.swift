//
//  ViewController.swift
//  Calculator
//
//  Created by  Robin Smith on 09/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isCleared: Bool = true
    var operationInProgress: String? = nil
    var operands: Array<Double> = []
    var brain: Brain = Brain(result: 0.0)
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if ((display.text!.count + 1) < 14) {
            if (isCleared) {
                display.text = digit
                isCleared = false
            } else {
                if (digit == "." && display.text!.contains(".")) {
                    // nothing
                } else {
                    display.text = display.text! + digit
                }
            }
        }
    }
    
    @IBAction func doOperation(_ sender: UIButton) {
        let title = sender.currentTitle!
        switch title {
        case "+", "-", "*", "/":
            if (operationInProgress == nil) {
                operationInProgress = title
                operands.append(displayValue)
                clearDisplay()
            }
        case "=":
            operands.append(displayValue)
            compute()
        case "C":
            clearDisplay()
            operationInProgress = nil
        default:
            break
        }
    }
    
    private func compute() {
        brain.compute(operands: operands, operationInProgress: operationInProgress!)
        let result: Double = brain.result
        
        if (floor(result) == result) {
            display.text = String(Int(result))
        } else {
            display.text = String(result)
        }
        
        operands = []
        operationInProgress = nil
    }
    
    private func clearDisplay() {
        display.text = "0"
        isCleared = true
    }
}

