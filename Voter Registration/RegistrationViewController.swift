//
//  RegistrationViewController.swift
//  Voter Registration
//
//  Created by Jeremy Evers on 3/14/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit
import Foundation

class RegistrationViewController: UIViewController {

    //MARK: Variables
    
    @IBOutlet weak var Citizen_switch: UISwitch!
    @IBOutlet weak var residentSwitch: UISwitch!
    @IBOutlet weak var ageSwitch: UISwitch!
    @IBOutlet weak var firstPageError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //obtained from: http://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegistrationViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    func toNameAndAge() -> Bool {
        if(!Citizen_switch.isOn || !residentSwitch.isOn || !ageSwitch.isOn)
        {
            displayError(errorText: firstPageError, errorMessage: "Must be a citizen, resident, and 18 before election day to register")
            return false;
        }
        return true;
     }
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func displayError(errorText: UILabel, errorMessage:String) {
        errorText.text = errorMessage
        NSLog(errorMessage)
        return
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?)-> Bool {
        if identifier == "firstFormToName"
        {
            return toNameAndAge()
        }
        return true
    }
    

}
