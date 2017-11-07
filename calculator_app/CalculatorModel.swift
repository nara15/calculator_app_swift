//
//  CalculatorModel.swift
//  calculator_app
//
//  Created by Mario Naranjo Leiva on 11/7/17.
//  Copyright © 2017 Mario Naranjo Leiva. All rights reserved.
//

import Foundation


struct CalculatorModel
{
    //  Enumeration for the possible values in the calculator
    private enum Operation
    {
        case unaryoperation((Double)->Double)
        case binaryoperation((Double, Double)->Double)
        case constant(Double)
        case equals
    }
    
    //  Bunch of operations for the calculator.
    private var operations : Dictionary<String, Operation> =
        [
            "+" : Operation.binaryoperation({$0 + $1}),
            "×" : Operation.binaryoperation({$0 * $1})
    ]
    
    //  Accumulator for operands.
    private var accumulator: Double?
    
    //  Struct to remember operand for binary operations
    private struct BinaryOperation{
        let firstoperand : Double
        let function : (Double, Double) -> Double
        
        func apply(with secondoperand : Double) -> Double
        {
            return function(firstoperand, secondoperand)
        }
    }
    
    // My binary struct instance
    private var binaryOperation : BinaryOperation?
    
    //======================================================
    
    /**
     *  Performs the operation with operands.
     *  Parameters: the operation symbol
     **/
    mutating func performOperation(_ pSymbol:String)
    {
        if let operation = operations[pSymbol] {
            
            switch operation{
            case .binaryoperation(let f):
                binaryOperation = BinaryOperation(firstoperand:accumulator!,function: f)
                accumulator = nil
            case .equals:
                print("realizar la op")
            default:
                print("unknow value")
                
            }
            
        }
       
    }
    
    /**
     * Sets a new operand to the accumulator
     * Parameters: The operand to replace the accumulator with.
     **/
    mutating func setOperand(_ pOperand:Double)
    {
        accumulator = pOperand
    }
    
    //  Devolver el resultado.
    var result: Double? {
        return accumulator
    }
}
