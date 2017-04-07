//
//  RegistrationPickerViewController.swift
//  Voter Registration
//
//  Created by MU IT Program on 4/6/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit

class RegistrationPickerViewController: UIViewController {

    @IBOutlet weak var segCon: UISegmentedControl!
    
    @IBOutlet weak var residencyView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var ruralView: UIView!
    @IBOutlet weak var birthView: UIView!
    
    var resView : UIViewController?
    var namView : UIViewController?
    var addView : UIViewController?
    var rurView : UIViewController?
    var birView : UIViewController?
    
    var currView = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView(newView: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeView(_ sender: Any) {
        setView(newView: segCon.selectedSegmentIndex)
    }
    
    func setView(newView : Int){
        switch(newView){
        case 0 :
            residencyView.isHidden = false
            hideView(currentView: currView)
            currView = 0
        case 1:
            nameView.isHidden = false
            hideView(currentView: currView)
            currView = 1
        case 2:
            addressView.isHidden = false
            hideView(currentView: currView)
            currView = 2
        case 3:
            ruralView.isHidden = false
            hideView(currentView: currView)
            currView = 3
        case 4:
            birthView.isHidden = false
            hideView(currentView: currView)
            currView = 4
        default:
            hideView(currentView: currView)
            residencyView.isHidden = false
            currView = 0
        }
    }
    
    func hideView(currentView : Int){
        
        switch(currentView){
        case 0:
            residencyView.isHidden = true
        case 1:
            nameView.isHidden = true
        case 2:
            addressView.isHidden = true
        case 3:
            ruralView.isHidden = true
        case 4:
            birthView.isHidden = true
        default: break
            
        }
        
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
