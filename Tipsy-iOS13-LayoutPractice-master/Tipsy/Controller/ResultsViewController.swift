//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vijay Sharma on 12/12/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var split = 0
    var tip = 0
    var total = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingLabel.text = "Split between \(split) people with a tip of: \(tip)"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        
    }

}
