//
//  BirthDateViewController.swift
//  Voter Registration
//
//  Created by MU IT Program on 4/6/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit

class BirthDateViewController: UIViewController {

    @IBOutlet weak var DOBPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func loadlist() {
        let defaults = UserDefaults.standard
        let userCalendar = Calendar.current

        //Retrieve saved data using defaults.object(forKey:"firstname")
        let date_of_birth = defaults.object(forKey: "date_of_birth") as! String
        let year_index = date_of_birth.index(date_of_birth.startIndex, offsetBy: 4)
        let month_index = date_of_birth.index(date_of_birth.startIndex, offsetBy: 2)
        
        
        let month = date_of_birth.substring(to: month_index)
        let date = date_of_birth[Range(month_index ..< year_index)]
        let year = date_of_birth.substring(from: year_index)
        
        var dateComponents = DateComponents()
        dateComponents.year = Int(year)
        dateComponents.month = Int(month)
        dateComponents.day = Int(date)
        let DOB = userCalendar.date(from: dateComponents)!

        DOBPicker.setDate(DOB, animated: false)
    }

}
