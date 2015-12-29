//
//  SettingsViewController.swift
//  tips
//
//  Created by Elizabeth Siegle on 12/27/15.
//  Copyright © 2015 Elizabeth Siegle. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var TipBar: UISegmentedControl!
    @IBOutlet var TipPercentage: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load key from NSUserDefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        print("User editing bill")
        
        defaults.synchronize()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultTipIndex = TipBar.selectedSegmentIndex
        
        defaults.setInteger(defaultTipIndex, forKey: "default_tip_index")
        
        defaults.synchronize()
        
        print("selected tip at index \(TipBar.selectedSegmentIndex)")
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultTipIndex = defaults.integerForKey("default_tip_index")
        
        TipBar.selectedSegmentIndex = defaultTipIndex
        

    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(TipBar.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
//        if(TipBar.selectedSegmentIndex == 0) {
//            defaults.selectedSegmentIndex == 0
//        }

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
