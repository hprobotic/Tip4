//
//  SettingsViewController.swift
//  Tip4
//
//  Created by Johnny Pham on 2/28/16.
//  Copyright © 2016 Johnny Pham. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var labelCurrentTipPercentage: UILabel!
    @IBOutlet weak var tipPercentageControl: UISlider!
    @IBOutlet weak var labelCurrentSplit: UILabel!
    @IBOutlet weak var splitControl: UISlider!

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentageDf = defaults.integerForKey("tipPercentage")
        let splitDf = defaults.integerForKey("split")
        labelCurrentTipPercentage.text = String(format: "%d %%", Int(tipPercentageDf) )
        labelCurrentSplit.text = String(format: "%d", Int(splitDf) )
        tipPercentageControl.value = (Float)(tipPercentageDf)
        splitControl.value = (Float)(splitDf)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSliderChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        
        let tipPercentage = roundf(tipPercentageControl.value)
        let split = roundf(splitControl.value)
        
        print(split)
        defaults.setInteger(Int(tipPercentage), forKey: "tipPercentage")
        defaults.setInteger(Int(split), forKey: "split")
        
        
        defaults.synchronize()
        
        labelCurrentTipPercentage.text = String(format: "%d %%", Int(tipPercentage) )
        labelCurrentSplit.text = String(format: "%d", Int(split) )
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
