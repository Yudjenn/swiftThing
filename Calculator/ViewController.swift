//
//  ViewController.swift
//  Calculette
//
//  Created by Yudjen on 09/11/2022.
//

import UIKit

extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var firstNumber: Double = 0
    var Mathing: Bool = false
    var operation = 0
    var point: Bool = false
    var neg: Bool = false
    
    @IBOutlet weak var carillon: UILabel!

    @IBAction func numbers(_ sender: UIButton)
    {
        
        if Mathing == true && sender.tag != 17 && sender.tag != 18 && sender.tag != 19 {
            if carillon.text == "0" {
                carillon.text = ""
            }
            carillon.text = String(sender.tag-1)
            numberOnScreen = Double(carillon.text!)!
            Mathing = false
        }
        else if sender.tag != 17 && sender.tag != 18 && sender.tag != 19 {
            if carillon.text == "0" {
                carillon.text = ""
            }
            carillon.text = carillon.text! + String(sender.tag-1)
            numberOnScreen = Double(carillon.text!)!
        } else if sender.tag == 17 && point == false {
            carillon.text = carillon.text! + "."
            point = true
        } else if sender.tag == 18 && neg == false {
            carillon.text = "-" + carillon.text!
            numberOnScreen *= -1
            neg = true
        } else if sender.tag == 18 && neg == true {
            carillon.text = "" + carillon.text!
            numberOnScreen /= -1
            neg = false
        } else if sender.tag == 19 {
            let resultPer: Double = Double(carillon.text!)! / 100
            let PartieEntiereIntPer = Int(resultPer)
            let PartEntiereDoublePer = Double(PartieEntiereIntPer)
            let PartieDecimalPer: Double = resultPer - PartEntiereDoublePer
            if PartieDecimalPer == 0.0 {
                carillon.text = String(Int(Double(carillon.text!)! / 100)).maxLength(length: 9)
            } else if PartieDecimalPer != 0.0 {
                carillon.text = String(Double(carillon.text!)! / 100).maxLength(length: 9)
            }
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton)
    
    {
        if carillon.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            firstNumber = Double(carillon.text!)!
            
            if sender.tag == 12 //diviser
            {

            } else if sender.tag == 13 //fois
            {

            } else if sender.tag == 14 //moins
            {

            } else if sender.tag == 15 //plus
            {

            }
            
            operation = sender.tag
            
            Mathing = true
        }
        else if sender.tag == 16 {
            
            if operation == 12 {
                let resultDiv: Double = firstNumber / numberOnScreen
                let PartieEntiereIntDiv = Int(resultDiv)
                let PartEntiereDoubleDiv = Double(PartieEntiereIntDiv)
                let PartieDecimalDiv: Double = resultDiv - PartEntiereDoubleDiv
                if PartieDecimalDiv == 0.0 {
                    carillon.text = String(Int(firstNumber / numberOnScreen)).maxLength(length: 9)
                } else if PartieDecimalDiv != 0.0 {
                    carillon.text = String(firstNumber / numberOnScreen).maxLength(length: 9)
                }
            }
            else if operation == 13 {
                let resultMul: Double = firstNumber * numberOnScreen
                let PartieEntiereIntMul = Int(resultMul)
                let PartEntiereDoubleMul = Double(PartieEntiereIntMul)
                let PartieDecimalMul: Double = resultMul - PartEntiereDoubleMul
                if PartieDecimalMul == 0.0 {
                    carillon.text = String(Int(firstNumber * numberOnScreen)).maxLength(length: 9)
                } else if PartieDecimalMul != 0.0 {
                    carillon.text = String(firstNumber * numberOnScreen).maxLength(length: 9)
                }
            }
            else if operation == 14 {
                let resultMin: Double = firstNumber - numberOnScreen
                let PartieEntiereIntMin = Int(resultMin)
                let PartEntiereDoubleMin = Double(PartieEntiereIntMin)
                let PartieDecimalMin: Double = resultMin - PartEntiereDoubleMin
                if PartieDecimalMin == 0.0 {
                    carillon.text = String(Int(firstNumber - numberOnScreen)).maxLength(length: 9)
                } else if PartieDecimalMin != 0.0 {
                    carillon.text = String(firstNumber - numberOnScreen).maxLength(length: 9)
                }
            }
            else if operation == 15 {
                let resultPlus: Double = firstNumber * numberOnScreen
                let PartieEntiereIntPlus = Int(resultPlus)
                let PartEntiereDoublePlus = Double(PartieEntiereIntPlus)
                let PartieDecimalPlus: Double = resultPlus - PartEntiereDoublePlus
                if PartieDecimalPlus == 0.0 {
                    carillon.text = String(Int(firstNumber + numberOnScreen)).maxLength(length: 9)
                } else if PartieDecimalPlus != 0.0 {
                    carillon.text = String(firstNumber + numberOnScreen).maxLength(length: 9)
                }
            }
        }
        else if sender.tag == 11 {
            carillon.text = "0"
            numberOnScreen = 0
            firstNumber = 0
            Mathing = false
            neg = false
            point = false
            operation = 0
        }
    }
    
}

@IBDesignable extension UIButton {

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = 65
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
