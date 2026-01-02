//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Vijay Sharma on 03/12/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var yourBMIScore: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    
    var bmiScore: String?
    var bmicolor: UIColor?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourBMIScore.text = bmiScore
        suggestionLabel.text = advice
        view.backgroundColor = bmicolor
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
