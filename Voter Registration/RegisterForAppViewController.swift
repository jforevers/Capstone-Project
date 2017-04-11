//
//  RegisterForAppViewController.swift
//  Voter Registration
//
//  Created by Jeremy Evers on 4/8/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit
import Foundation

class RegisterForAppViewController: UIViewController {

    //VARIABLES
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    
    @IBAction func RegisterSubmit(_ sender: UIButton) {
    
        if isFieldEmpty(email: email, password: password) {
            displayError(errorText: errorText, errorMessage: "Please fill out both fields")
            return
        }
        
        //check if email is valid
        if !isValidEmail(email: self.email.text!) {
            displayError(errorText: errorText, errorMessage: "Invalid email address")
            return
        }
        
        if password.text != confirmPassword.text {
            displayError(errorText: errorText, errorMessage: "Passwords must match")
            return
        }
        
        //attempt to validate with database
        //attemptLogin(email: email.text!, password: password.text!)
        
        performSegue(withIdentifier: "registrationComplete", sender: nil)
    }

    @IBAction func backToLoginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backToLogin", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
