//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain(total: 0.0, tipSelected: 0.0)
    
    var total: Float?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        calculatorBrain.tipSelected = (sender.currentTitle!.dropLast() as NSString).floatValue
        
        billTextField.endEditing(true)

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        calculatorBrain.setTotal(bill: Float(billTextField.text ?? "0.0")!, tip: calculatorBrain.getTipSelected(), split: Float(splitNumberLabel.text!)!)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = String(format: "%.2f", (calculatorBrain.getTotal()))
        }
        
        
    }

    
}

