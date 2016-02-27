//
//  ViewController.swift
//  Tip4
//
//  Created by Johnny Pham on 2/26/16.
//  Copyright © 2016 Johnny Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalTip: UILabel!
    @IBOutlet weak var totalSplit: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var splitPercentage: UILabel!
    @IBOutlet weak var labelTotalPay: UILabel!
    @IBOutlet weak var totalForPerson: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageSliderValue: UISlider!
    @IBOutlet weak var splitControl: UISlider!
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentageDf = defaults.integerForKey("tipPercentage")
        let splitDf = defaults.integerForKey("split")
        let splitPercentageDf = (Float)(1)/(Float)(splitDf)*(Float)(100)
        
        tipPercentageSliderValue.value = (Float)(tipPercentageDf)
        splitControl.value = (Float)(splitDf)
        
        print(splitPercentageDf)
        
        
        
        
        totalTip.text = "0.00"
        totalSplit.text = "\(splitDf)"
        
        tipPercentage.text = "\(tipPercentageDf) %"
        splitPercentage.text = "\(splitPercentageDf) %"
        
        labelTotalPay.text = "TOTAL: 0.00"
        totalForPerson.text = "0.00"
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditChanged(sender: AnyObject) {
        
        
        
        
        
        let tipControlValue = roundf(tipPercentageSliderValue.value)
        let splitControlValue = roundf(splitControl.value)
        
        
        
        
        let vBillAmount = NSString(string: billAmountTextField.text!).floatValue
        let vTotalPerson = splitControlValue
        let vTotalTip = vBillAmount*tipControlValue/100
        let vTotalPay = vTotalTip + vBillAmount
        let vTotalForPerson = vTotalTip/vTotalPerson
        
        
        totalTip.text = "\(vTotalTip)"
        totalSplit.text = "\(Int(splitControlValue))"
        
        tipPercentage.text = String(format: "%.f %%", tipControlValue )
        splitPercentage.text = String(format: "%.0f %%", 1/vTotalPerson*100)
        
        labelTotalPay.text =  String(format: "TOTAL: %.2f", vTotalPay )
        totalForPerson.text = String(format: "%.2f", vTotalForPerson )
        
        
        
        
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

