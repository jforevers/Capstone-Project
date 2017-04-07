//
//  ChangeProfileViewController.swift
//  Voter Registration
//
//  Created by MU IT Program on 4/3/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit

class ChangeProfileViewController: UIViewController {

    @IBOutlet weak var segCon: UISegmentedControl!
    @IBOutlet weak var changeAdd: UIView!
    @IBOutlet weak var changeName: UIView!
    
    @IBOutlet weak var addChange: UIView!
    @IBOutlet weak var nameChange: UIView!
    @IBOutlet weak var takeTwo: UISegmentedControl!
    
    var nameController : ChangeNameViewController?
    var addController : ChangeAddressViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // takeTwo.selectedSegmentIndex = 0
        setSelectedView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeView(_ sender: Any) {
        setSelectedView()
    }
    
    func setSelectedView() {
        if (takeTwo.selectedSegmentIndex == 0) {
            nameChange.isHidden = false;
            addChange.isHidden = true;
        } else {
            nameChange.isHidden = true;
            addChange.isHidden = false;
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
/*
 
 
 import UIKit
 
 class ViewController: UIViewController {
 
 @IBOutlet weak var segmentedControl: UISegmentedControl!
 @IBOutlet weak var containerView1: UIView!
 @IBOutlet weak var containerView2: UIView!
 @IBOutlet weak var infoLabel1: UILabel!
 @IBOutlet weak var infoLabel2: UILabel!
 
 var viewController1 : ViewController1?
 var viewController2 : ViewController2?
 

 @IBAction func changeView(_ sender: AnyObject) {
 // set the container view that is to be visible based on the selected segment
 setSelectedView()
 }
 
 
 // If I have the view controllers that are associated with each container view
 // I can get data from them.
 @IBAction func retrieveData(_ sender: AnyObject) {
 if let viewController1 = self.viewController1 {
 infoLabel1.text = viewController1.textField.text
 }
 if let viewController2 = self.viewController2 {
 infoLabel2.text = viewController2.textField.text
 }
 }

 // The prepare for segue function gets called when view controllers
 // are set for container views as a result of them having embed segues.
 // This happens before the viewDidLoad for this view controller gets called.
 // So, viewController1 and viewController2 are known in viewDidLoad.
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 print("prepare for segue")
 
 // To get references to the view controllers:
 
 // This uses the segue.identifier to indicate what view controller
 // we are getting in the segue.destination which also indicates what it is
 // intended to be used for.
 
 if let id = segue.identifier {
 switch(id) {
 case "viewController1":
 viewController1 = segue.destination as? ViewController1
 viewController1?.initialTextData = "initial 1"  // send some initial data to use
 
 case "viewController2":
 viewController2 = segue.destination as? ViewController2
 viewController2?.initialTextData = "initial 2"  // send some initial data to use
 
 default: break
 
 }
 }
 
 }
 
 }
 
*/
