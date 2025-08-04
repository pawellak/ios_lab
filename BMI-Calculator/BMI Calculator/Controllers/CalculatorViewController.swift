//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    
    @IBOutlet weak var sliderHeight: UISlider!
        @IBOutlet weak var sliderWeight: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        labelHeight.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        labelWeight.text = String(format: "%.2f", sender.value) + " kg"
    }
    @IBAction func onCalculateButtonPressed(_ sender: UIButton) {
        let height = sliderHeight.value
        let weight = sliderHeight.value
        
        let bmi = weight / (height * height)
        
        let secondVC = ResultViewController()
//        secondVC.bmiValue = String(format:"%.1f",bmi)
//        self.present(secondVC, animated: true,completion: nil)
    }
}
 
