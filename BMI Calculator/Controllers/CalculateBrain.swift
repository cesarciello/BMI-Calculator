//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Cesar Ciello on 01/02/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit


struct CalculateBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight/pow(height, 2)
        if bmiValue < 18.5 {
            print("UnderWeight")
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), advice: "Eat more pies!")
        }else if bmiValue < 24.9 {
            print("Normal")
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), advice: "Fit as a fiddle!")
        }else {
            print("OverWeight")
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), advice: "Eat less pies!")
        }
    }
    
    func getBMIValue() ->  String {
        let bmiDecimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiDecimal
    }
    
    func getBMIColor() ->  UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    func getBMIAdvice() ->  String {
        return bmi?.advice ?? "Eat more pies"
    }
}
