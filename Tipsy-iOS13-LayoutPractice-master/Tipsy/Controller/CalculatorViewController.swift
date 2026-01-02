//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 0
    var billTotal = 0.0
    var finalTotal = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipTapped(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = (buttonTitleAsANumber / 100)
    
 //made by me
//        if sender == zeroPctButton {
//            zeroPctButton.isSelected = true
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//            
//            prevalue = Double(0.0 / 100)
//            
//            
//        } else if sender == tenPctButton {
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = true
//            twentyPctButton.isSelected = false
//            
//            prevalue = 10.0 / value
//        } else if sender == twentyPctButton {
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = true
//            
//            prevalue = 20.0 / value
//        } else {
//            zeroPctButton.isSelected = false
//            tenPctButton.isSelected = false
//            twentyPctButton.isSelected = false
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ResultsViewController {
            destinationVC.split = numberOfPeople
            destinationVC.tip = Int(tip * 100)
            destinationVC.total = finalTotal
        }
    }
    
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let bill = billTextField.text ?? ""
        
        if bill != "" {
            
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            finalTotal = resultTo2DecimalPlaces
        }
        performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNumberLabel.text = String(format: "%0.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
}

