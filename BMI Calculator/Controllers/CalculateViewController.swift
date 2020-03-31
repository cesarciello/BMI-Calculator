//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculateBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightDataLabel: UILabel!
    @IBOutlet weak var weightDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightDataLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightDataLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func calculetePress(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
    
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = calculatorBrain.getBMIValue()
            resultVC.color = calculatorBrain.getBMIColor()
            resultVC.advice = calculatorBrain.getBMIAdvice()
        }
    }
}
