//
//  SettingController.swift
//  Tip Calculator
//
//  Created by Pavani Vellal on 3/13/17.
//  Copyright © 2017 Pavani Vellal. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    
    @IBOutlet weak var val1: UITextField!
    
    @IBOutlet weak var val2: UITextField!
    
    @IBOutlet weak var val3: UITextField!
    
    
    
    
    @IBAction func save(_ sender: Any) {
        
        var tipPercentage : [Double] = []
        
        tipPercentage.append(Double(val1.text!) ?? 0)
        tipPercentage.append(Double(val2.text!) ?? 0)
        tipPercentage.append(Double(val3.text!) ?? 0)
        
        let defaults = UserDefaults.standard
        
        defaults.set(tipPercentage, forKey: "setVals")
        
        let refreshAlert = UIAlertController(title: "Success", message: "Data Saved", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(refreshAlert, animated: true, completion: nil)

    }
    
    
    @IBAction func cancel(_ sender: Any) {
      val1.text = ""
      val2.text = ""
      val3.text = ""
        
    }
}
