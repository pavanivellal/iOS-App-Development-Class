//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sheshagiri Haniyur on 3/12/17.
//  Copyright © 2017 Pavani Vellal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipVal: UILabel!
    @IBOutlet weak var totalVal: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    

//  On tap of view controller make key pad go away
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
//    Calculate Tip on "bill" chaged event
    @IBAction func billChanged(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.20,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipVal.text = String.init(format: "$%0.2f", tip)
        totalVal.text = String.init(format: "$%0.2f", total)
        
    }
    
    



}

