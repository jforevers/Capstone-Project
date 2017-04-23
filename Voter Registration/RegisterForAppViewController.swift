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
        
        var request = URLRequest(url: URL(string: "http://52.176.106.72/register.php")!)
        request.httpMethod = "POST"
        let postString = "email=" + email.text! + "&password=" + password.text!
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error ?? "An unknown error occured.")
            }
            else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    print(parsedData)
                    
                    if let successful = parsedData["successful"] as? Bool {
                        //LOGIN FAILED/INVALID CREDENTIALS (DISPLAY AN ERROR)
                        if (successful == false) {
                            if let message = parsedData["error"] as? String {
                                displayError(errorText: self.errorText, errorMessage: message)
                            }
                        }
                        else {
                            //print(parsedData["user"])
                            
                                let defaults = UserDefaults.standard
                                defaults.set(true, forKey: "loggedIn")
                                defaults.set(self.email.text, forKey: "username")
                                self.performSegue(withIdentifier: "registrationComplete", sender: nil)
                        }
                    }
                } catch let error as NSError {
                    print(error)
                    print("hell")
                }
            }
        }
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey:"loggedIn") == true) {
            print("made it here")
            performSegue(withIdentifier: "registrationComplete", sender: nil)
        }

        checkIfLoggedIn()
        task.resume()
    }
    
    func checkIfLoggedIn() {
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey:"loggedIn") == true) {
            print("made it here")
            performSegue(withIdentifier: "registrationComplete", sender: nil)
        }
    }

    @IBAction func backToLoginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backToLogin", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
