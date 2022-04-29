//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Lakith Pusarla on 27/04/22.
//  Copyright © 2022 Lakith Pusarla. All rights reserved.
//


//KINDLY IGNORE COMMENTS BUT DO NOT DELETE THEM
import UIKit
var calculationString = ""
var numberPressed = ""
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.text = "0"
    }

    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        //print(sender.currentTitle!)
     
        changeLabel(sender.currentTitle!)
        if sender.tag == 15{
            displayLabel.text = "0"
            //print("Before: \(calculationString)")
            calculationString.removeAll()
            //print("After: \(calculationString)")
            
            
        } else if sender.tag == 16 {
            //print("reached calculation part")
            let expression = NSExpression(format: calculationString)
//          Working but decimal value of answer
            //is shown even without decimal inputs
//          if let result  = expression.expressionValue(with: nil, context: nil) as? NSNumber {
//              let resultDouble = result.doubleValue
//              displayLabel.text = "\(resultDouble)"
//          }
            //CURRENTLY WORKING
            //NSExpression converted into Double
            //instead of NSNumber
            //Decimal value of answer shown
            //even if non decimal inputs
//            if let result  = expression.expressionValue(with: nil, context: nil) as? Double {
////                let resultDouble = result.doubleValue
//                displayLabel.text = "\(result)"
//            }
            
            if let result  = expression.expressionValue(with: nil, context: nil) as? Double {
                let resultDec = Decimal(result)
                displayLabel.text = "\(resultDec)" // placed for temporary testing
//              Currently using only the else part
                //does not show decimal part for non decimal inputs
                
                //Need to verify for decimal inputs
//                if #available(iOS 15.0, *) {
//
//                    let resultDou = resultDec.formatted()
//                    displayLabel.text = resultDou
//                } else {
//                    displayLabel.text = "\(resultDec)"
                    // Fallback on earlier versions
             //   }
            }
            
            //NSObject OCobject = new NSObject()
         //   string str = OCobject.Description;
                       
        } else if sender.tag >= 0 && sender.tag <= 9 {
                print(sender.tag)
                calculationString.append(String(sender.tag))
                numberPressed.append(String(sender.tag))
                numberPress(numberPressed)
               // print(numberPressed)
                
                
                
            
            } else {
            switch sender.tag {
            case 10:
                calculationString.append("+")
            case 11:
                calculationString.append("-")
            case 12:
                calculationString.append("*")
            case 13:
                calculationString.append("/")
            case 14:
                calculationString.append(".")
            default:
                displayLabel.text = "WRONG ENTRY"
            }
            changeLabel(sender.currentTitle!)
            numberPressed.removeAll()
        }
        
        
    }
    
    @IBAction func noResponse(_ sender: UIButton){
        displayLabel.text = "Currently not working"
    }
    
    func changeLabel(_ title: String){
        
        displayLabel.text = title
    }
    
    func numberPress(_ number : String){
        displayLabel.text = number

    }
    
    
}

