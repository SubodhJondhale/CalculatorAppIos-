//
//  AppDelegate.swift
//  Calculator
//
//  Created by Subodh Jondhale on 15/05/2024.
//

import Foundation

struct CalculatorLogic {

   private var number : Double?

   private var interMediateCalculation : (n1: Double, calcMethod: String)?

    mutating func setNumber (_ number : Double){
        self.number = number
    }
    
    mutating func Calculate (symbol : String) -> Double? {

        if let n = number{
            switch symbol {
            case "+/-" :
                return n * -1
            case "AC" :
                return  0
            case "%" :
                return  n * 0.01
            case "=" :
               return  performTwoNoCalculation(n2:n)
            default :
                 interMediateCalculation = (n1: n,calcMethod: symbol)
            }

        }


        return nil
    }
    private func performTwoNoCalculation(n2:Double)->Double? {
        if let n1 = interMediateCalculation?.n1, let operation = interMediateCalculation?.calcMethod{

            switch operation {
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "*":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("the operation passed does not match any of the cases")
            }

        }
        return nil
    }
}
