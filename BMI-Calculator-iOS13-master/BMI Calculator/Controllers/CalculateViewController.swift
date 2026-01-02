//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var hightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var hightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    private var currentBMIScore: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hightSlider.value = 0
        weightSlider.value = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiScore = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.bmicolor = calculatorBrain.getBmiColor()
        }
    }
    
    @IBAction func hightSliderTapped(_ sender: UISlider) {
        
        let hight = String(format: "%.2f", sender.value)
        
        hightLabel.text = "\(hight)m"
        //print(round(sender.value * 100) / 100)
    }
    
    @IBAction func weightSliderTapped(_ sender: UISlider) {
        
        let weight = String(format: "%.0f", sender.value)
        
        weightLabel.text = "\(weight)Kg"
       
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let hight = hightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: Float(hight), weight: Float(weight))
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
    
}
