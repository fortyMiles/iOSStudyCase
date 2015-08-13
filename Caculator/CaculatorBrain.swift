//
//  CaculatorBrain.swift
//  Caculator
//
//  Created by 高民权 on 7/21/15.
//  Copyright (c) 2015 Gaominquan. All rights reserved.
//

import Foundation //Foundation is a layer that kinda core service layer

//It don't have UI staff because our modal is UI independent so there should be no UI in here.

// So never import UIKit in modal

class CaculatorBrain{
    
    private enum Op : Printable{
        // they dont't have inheritate but has properties and method.
        case Operand(Double)
        case SingleOperation(String, Double -> Double)
        case BinaryOperastions(String, (Double, Double) -> Double)
        
        var description: String{
            get{
                switch self{
                case .Operand(let oprand):
                    return "\(oprand)"
                case .SingleOperation(let symbol, _):
                    return symbol
                case .BinaryOperastions(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()
    
    private var knowsOps = [String:Op]()
    
    init(){
        func learnOp (op: Op){
            knowsOps[op.description] = op
        }
        
        learnOp(Op.BinaryOperastions("×", *))
        learnOp(Op.BinaryOperastions("÷") {$1 / $0})
        learnOp(Op.BinaryOperastions("+", +))
        learnOp(Op.BinaryOperastions("−") {$1 - $0})
        learnOp(Op.SingleOperation("√", sqrt))
        //This brace is a function that takes one argument and returns one argument.
    }
    
    
    var program: AnyObject{
        get{
            return opStack.map { $0.description}
        }
        
        set{
            
        }
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainOps: [Op]){
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op{
            case .Operand(let operand):
                return (operand, remainingOps)
            case .SingleOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result{
                    return (operation(operand), operandEvaluation.remainOps)
                }
            case .BinaryOperastions(_ , let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result{
                    let op2Evalution = evaluate(op1Evaluation.remainOps)
                    if let operand2 = op2Evalution.result{
                        return (operation(operand1, operand2), op2Evalution.remainOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, reminder) = evaluate(opStack)
        
        println("\(opStack) = \(result) with \(reminder) left over")
        return result
    }
    
    func pushOperand(operand:Double) -> Double? {
        opStack.append(Op.Operand(operand)) // change operand Double to a Op
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double?{
        if let operation = knowsOps[symbol]{
            opStack.append(operation)
        }
        
        return evaluate()
    }
    
    // Struct pass by value, but class pass by reference
}