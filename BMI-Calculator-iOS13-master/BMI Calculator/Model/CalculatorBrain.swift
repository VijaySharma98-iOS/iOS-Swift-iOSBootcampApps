//
//  File.swift
//  BMI Calculator
//
//  Created by Vijay Sharma on 08/12/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmivalue:BMIModel?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let calculateBMI = weight / (height * height)
        
        if calculateBMI <= 18.5 {
            bmivalue = BMIModel(value: calculateBMI, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), advice: "Eat more pizza!")
        } else if calculateBMI < 24.9 {
            bmivalue = BMIModel(value: calculateBMI, color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), advice: "Fit as a fiddle!")
        } else if calculateBMI > 24.9 {
            bmivalue = BMIModel(value: calculateBMI, color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), advice: "Eat less pizza!")
        }
    }
    
    func getBmiValue() -> String {
        let bmiToOneDecimal = String(format: "%.1f", bmivalue?.value ?? 0.0)
        return bmiToOneDecimal
    }
    
    func getAdvice() -> String {
        return bmivalue?.advice ?? "No advice available"
    }
    
    func getBmiColor() -> UIColor {
        return bmivalue?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
}
