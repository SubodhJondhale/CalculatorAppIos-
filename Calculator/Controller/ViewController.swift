//
//  AppDelegate.swift
//  Calculator
//
//  Created by Subodh Jondhale on 15/05/2024.
//


import UIKit

class ViewController: UIViewController {
   
    private var isFinishedTypingNo : Bool = true
    private var displayValue : Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("cannot convert displayLabelText to a Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator =  CalculatorLogic( )

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNo = true

        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTitle{



            if let result = calculator.Calculate(symbol: calcMethod)  {
                displayValue = result
            }

        }

    }


    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            if isFinishedTypingNo {
                displayLabel.text = numValue
                isFinishedTypingNo = false
            }else{

                if numValue == "." {

                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }

        }

    }

}

