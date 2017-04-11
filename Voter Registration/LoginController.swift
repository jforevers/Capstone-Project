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
//        if !isValidEmail(email: self.email.text!) {
//            displayError(errorText: errorText, errorMessage: "Invalid email address")
//            return
//        }
        //attempt to validate with database
        var request = URLRequest(url: URL(string: "http://52.176.106.72/login.php")!)
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
                    
                    if let successful = parsedData["loginsuccessful"] as? Bool {
                        //LOGIN FAILED/INVALID CREDENTIALS (DISPLAY AN ERROR)
                        if (successful == false) {
                            if let message = parsedData["error"] as? String {
                                displayError(errorText: self.errorText, errorMessage: message)
                            }
                        }
                        else {
                            //print(parsedData["user"])
                            if let user = parsedData["user"] as? [String: Any] {
                                
                                let defaults = UserDefaults.standard
                                //SAVE USER INFO TO DEVICE
                                //Retrieve using defaults.object(forKey:"firstname")
                                if let firstname = user["firstname"] as? String {
                                    defaults.set(firstname, forKey: "firstname")
                                }
                                if let mname = user["mname"] as? String {
                                    defaults.set(mname, forKey: "mname")
                                }
                                if let lname = user["lname"] as? String {
                                    defaults.set(lname, forKey: "lname")
                                }
                                if let address = user["address"] as? String {
                                    defaults.set(address, forKey: "address")
                                }
                                if let gender = user["gender"] as? String {
                                    defaults.set(gender, forKey: "gender")
                                }
                                if let voterid = user["voterid"] as? String {
                                    defaults.set(voterid, forKey: "voterid")
                                }
                                if let registered = user["registered"] as? String {
                                    defaults.set(registered, forKey: "registered")
                                }
                                if let username = user["username"] as? String {
                                    defaults.set(username, forKey: "username")
                                }
                                if let election_district = user["election_district"] as? String {
                                    defaults.set(election_district, forKey: "election_district")
                                }
                                if let registration_date = user["registration_date"] as? String {
                                    defaults.set(registration_date, forKey: "registration_date")
                                }
                                if let date_of_birth = user["date_of_birth"] as? String {
                                    defaults.set(date_of_birth, forKey: "date_of_birth")
                                }
                                if let longitude = user["longitude"] as? String {
                                    defaults.set(longitude, forKey: "longitude")
                                }
                                if let latitude = user["latitude"] as? String {
                                    defaults.set(latitude, forKey: "latitude")
                                }
                                if let location_id = user["location_id"] as? String {
                                    defaults.set(location_id, forKey: "location_id")
                                }

                                defaults.set(true, forKey: "loggedIn")
                            }
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        
        checkIfLoggedIn()
        task.resume()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkIfLoggedIn() {
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey:"loggedIn") == true) {
            performSegue(withIdentifier: "loginComplete", sender: nil)
        }
    }
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
