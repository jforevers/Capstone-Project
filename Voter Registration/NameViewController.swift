//
//  NameViewController.swift
//  Voter Registration
//
//  Created by MU IT Program on 4/6/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var fname_text: UITextField!
    @IBOutlet weak var mname_text: UITextField!
    @IBOutlet weak var lname_text: UITextField!
    @IBOutlet weak var suffix_text: UITextField!
    @IBOutlet weak var gender_segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadlist), name: NSNotification.Name(rawValue: "load"), object: nil)
        self.hideKeyboardWhenTappedAround() 

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
        if let lname = defaults.object(forKey: "lname"){
            lname_text.text = lname as? String
        }
        if let fname = defaults.object(forKey: "firstname"){
            fname_text.text = fname as? String
        }
        if let mname = defaults.object(forKey: "mname"){
            mname_text.text = mname as? String
        }
        if let suffix = defaults.object(forKey: "suffix"){
            suffix_text.text = suffix as? String
        }
        if let gender = defaults.object(forKey: "gender") as? Int{
            gender_segment.selectedSegmentIndex = gender - 1
        }
    }
}
