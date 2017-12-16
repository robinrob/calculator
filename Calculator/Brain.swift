//
//  Brain.swift
//  Calculator
//
//  Created by  Robin Smith on 10/11/2017.
//  Copyright © 2017  Robin Smith. All rights reserved.
//

import Foundation

struct Brain {
    var result: Double
    
    mutating func compute(operands: Array<Double>, operationInProgress: String) {
        switch operationInProgress {
        case "+":
            result = operands.reduce(0, +)
        case "-":
            result = operands[1 ... operands.count-1].reduce(operands[0], -)
        case "*":
            result = operands[1 ... operands.count-1].reduce(operands[0], *)
        case "/":
            result = operands[1 ... operands.count-1].reduce(operands[0], /)
        default:
            break
        }
    }
}
