import Foundation
import UIKit

class LoginController: UIViewController {
    //VARIABLES
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    
    @IBAction func pressLogin(_ sender: UIButton) {
        //check if either fields are empty
        if isFieldEmpty(email: email, password: password) {
            displayError(errorText: errorText, errorMessage: "Please fill out both fields")
            return
        }
        
        //check if email is valid
        if !isValidEmail(email: self.email.text!) {
            displayError(errorText: errorText, errorMessage: "Invalid email address")
            return
        }
        
        //attempt to validate with database
        attemptLogin(email: email.text!, password: password.text!)
        
        performSegue(withIdentifier: "loginComplete", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

func attemptLogin(email:String, password:String) {
    NSLog("Tring to login with email: \(email), password: \(password)")
    return
}

func displayError(errorText: UILabel, errorMessage:String) {
    errorText.text = errorMessage
    NSLog(errorMessage)
    return
}

func isFieldEmpty(email:UITextField, password:UITextField) -> Bool {
    if email.text!.isEmpty || password.text!.isEmpty {
        return true
    }

    return false
}

func isValidEmail(email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
}
