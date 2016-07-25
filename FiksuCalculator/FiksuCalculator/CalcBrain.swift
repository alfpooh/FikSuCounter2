//
//  CalcBrain.swift
//  FiksuCalculator
//
//  Created by donghoon bae on 2016. 7. 14..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0
    private var internalProgram = [AnyObject]()
    
    func setOperand (operand: Double) {
        accumulator = operand
        internalProgram.append(operand)
    }
    
    private var operations: Dictionary<String, Operation> = [
        
        "+": Operation.BinaryOperation({$0+$1}),
        "−": Operation.BinaryOperation({$0-$1}),
        "×": Operation.BinaryOperation({$0*$1}),
        "÷": Operation.BinaryOperation({$0/$1}),
        "±": Operation.UnaryOperation({-$0}),
        "√": Operation.UnaryOperation({ sqrt($0) }),
        "Round": Operation.Rounding({round($0)}),
        "x\u{B2}": Operation.UnaryOperation({$0*$0}),
        "=": Operation.Equals,
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E)
        
        
    ]
    
    
    private enum Operation {
        
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
        case Rounding((Double) -> Double)
    }
    
    func  performOperation(symbol: String) {
        
        internalProgram.append(symbol)
        if let operation = operations[symbol] {
            
            switch operation {
                
            case .Constant(let value):
                accumulator = value
                
            case .Rounding(let function):
                executePendingBinaryOperation()
                accumulator = function(accumulator)
                print ("rounding is here")

            case .UnaryOperation(let function):
                accumulator = function(accumulator)
                
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction:function, firstOperand:accumulator)
            case .Equals:
                executePendingBinaryOperation()
                
            }
            
        }
    }
    
    private func executePendingBinaryOperation () {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction:(Double,Double) -> Double
        var firstOperand: Double
    }
    
    typealias PropertyList = AnyObject
    
    private var program: PropertyList {
        get {
            return internalProgram
        }
        set {
            clear()
            if let arryOfOps = newValue as? [AnyObject] {
                for op in arryOfOps {
                    if let operand = op as? Double {
                    setOperand (operand)
                    } else if let operand = op as? String {
                    performOperation (operand)
                    }
                }
            }
        }
    }
    
    func clear () {
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result: Double{
        get {
            return accumulator
        }
        set {
            accumulator = newValue
        }
    }
    
}
