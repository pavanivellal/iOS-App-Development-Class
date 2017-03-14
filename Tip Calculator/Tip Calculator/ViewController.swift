//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Pavani Vellal on 3/12/17.
//  Copyright © 2017 Pavani Vellal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipVal: UILabel!
    @IBOutlet weak var totalVal: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [18.00,20.00,25.00]
    let defaults = UserDefaults.standard

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let temp = defaults.object(forKey: "setVals") as? [Double] {
            tipPercentages = temp 
        }
        
        for index in tipPercentages.indices{
            let strVal = String.init(format: "%0.0f%%", tipPercentages[index])
            self.tipControl.setTitle(String(strVal), forSegmentAt:index)
        }
        
        billField.text = ""
        tipVal.text = "$0.00"
        totalVal.text = "$0.00"
        tipControl.selectedSegmentIndex = 0
        
        
    }
    

//  On tap of view controller make key pad go away
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
//    Calculate Tip on "bill" chaged event
    @IBAction func billChanged(_ sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * (tipPercentages[tipControl.selectedSegmentIndex] * 0.01)
        let total = bill + tip
        
        tipVal.text = String.init(format: "$%0.2f", tip)
        totalVal.text = String.init(format: "$%0.2f", total)
        
    }

    
    



}

