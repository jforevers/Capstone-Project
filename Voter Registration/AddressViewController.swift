//
//  AddressViewController.swift
//  Voter Registration
//
//  Created by MU IT Program on 4/6/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var mail: UISegmentedControl!
    @IBOutlet weak var rural: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        NotificationCenter.default.addObserver(self, selector: #selector(loadlist), name: NSNotification.Name(rawValue: "load"), object: nil)


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
    
    func loadlist(){
        let defaults = UserDefaults.standard
        //Retrieve saved data using defaults.object(forKey:"firstname")
        if let street_name = defaults.object(forKey: "street_address"){
            street.text = street_name as? String
        }
        if let city = defaults.object(forKey: "city_address"){
            self.city.text = city as? String
        }
        if let zipcode = defaults.object(forKey: "zipcode"){
            zip.text = zipcode as? String
        }
        if let state = defaults.object(forKey: "state_address"){
            self.state.text = state as? String
        }
    }

}
