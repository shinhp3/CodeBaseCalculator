//
//  CalculatorLogic.swift
//  UIkitCodeBaseCalculator
//
//  Created by 신효범 on 6/29/24.
//

import Foundation

class CalculatorLogic {
    private var number: Int = 0
    private var previousNumber: Int = 0
    private var operation: String?
    
    var displayNumber: Int {
        return number
    }
    
    
    func inputNumber(_ num: Int) {
            number = number * 10 + num
    }
    
    
    func setOperation(_ operation: String) {
        self.operation = operation
        previousNumber = number
        number = 0
        print("Set operation to: \(operation), previous number: \(previousNumber)")
    }
    
    
    func calculatorResult() -> Int? {
        guard let operation = operation else { 
            print("Operation is nil")
            return nil }
        
        print("Calculating result for operation: \(operation)") 
        print("Previous number: \(previousNumber), Current number: \(number)")
        
        switch operation {
        case "+":
            number = previousNumber + number
        case "-":
            number = previousNumber - number
        case "×":
            number = previousNumber * number
        case "÷":
            if number != 0 {
                number = previousNumber / number
            } else {
                print("Division by zero error")
                return nil
            }
        default:
            print("Unknown operation")
            break
        }
        self.operation = nil
        return number
    }
    
    
    func reset() {
        number = 0
        previousNumber = 0
        operation = nil
    }
    
}
