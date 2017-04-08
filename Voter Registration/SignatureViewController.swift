//
//  SignatureViewController.swift
//  Voter Registration
//
//  Created by Jeremy Evers on 4/8/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit

class SignatureViewController: UIViewController {

    
    @IBOutlet weak var DateLabel: UILabel!
    var timer: Timer?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        let date = NSDate()
        DateLabel.text = dateFormatter.string(from: date as Date)
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
    
    @IBAction func SubmitRegistration(_ sender: UIButton) {
    }
    

}
