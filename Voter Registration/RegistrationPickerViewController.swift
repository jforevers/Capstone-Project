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
    
    var resView : ResidencyViewController?
    var namView : NameViewController?
    var addView : AddressViewController?
    var rurView : RuralViewController?
    var birView : BirthDateViewController?
    
    var currView = 3
    
    var age = false
    var citizen = false
    var resident = false
    
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
        if !errorCheck(currentView: currView){
            segCon.selectedSegmentIndex = currView
            return
        }
        setView(newView: segCon.selectedSegmentIndex)
    }
    
    func errorCheck(currentView : Int)->Bool{
        
        switch(currentView){
        case 0:
            age = (resView?.age.isOn)!
            citizen = (resView?.citizen.isOn)!
            resident = (resView?.resident.isOn)!
            if !age {
                let alert = UIAlertController(title: "Underage", message: "You must be 18 years of age to vote.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if !citizen{
                let alert = UIAlertController(title: "Citizen", message: "You must be a United States citizen to vote.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if !resident{
                let alert = UIAlertController(title: "Residency", message: "You must be a resident of Missouri to vote in Missouri.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else{
                return true
            }
        //name
        case 1:
            if (namView?.fname.text?.isEmpty)! {
                let alert = UIAlertController(title: "First Name", message: "Please enter your first name.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (namView?.lname.text?.isEmpty)! {
                let alert = UIAlertController(title: "Last Name", message: "Please enter your last name.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else{
                return true
            }
        //address
        case 2:
            if (addView?.city.text?.isEmpty)! {
                let alert = UIAlertController(title: "City", message: "Please specify the city in which you live.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if ((addView?.state.text?.isEmpty)! || (addView?.state.text?.characters.count)! != 2) {
                let alert = UIAlertController(title: "State", message: "Please specify the state in which you live.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (addView?.street.text?.isEmpty)! {
                let alert = UIAlertController(title: "Street", message: "Please enter your current street address.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (addView?.street.text?.isEmpty)! {
                let alert = UIAlertController(title: "Street", message: "Please enter your current street address.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else{
                return true
            }
        
        //rural
        case 3:
            if (rurView?.landmark.text?.isEmpty)! {
                let alert = UIAlertController(title: "Landmark", message: "Please specify a landmark or junction you live near.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (rurView?.miles.text?.isEmpty)! {
                let alert = UIAlertController(title: "Miles", message: "Please specify how close you are to your selected town.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (rurView?.neigbors.text?.isEmpty)! {
                let alert = UIAlertController(title: "Neighbors", message: "Please enter your closest neighbors.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (rurView?.section.text?.isEmpty)! {
                let alert = UIAlertController(title: "Sections", message: "Please enter your current section, township, or range.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else{
                return true
            }
        //because its required
        default:
            return true
        
        
        }
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


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            switch(id){
            case "residency":
                    resView = segue.destination as? ResidencyViewController
            case "name":
                    namView = segue.destination as? NameViewController
            case "address":
                    addView = segue.destination as? AddressViewController
            case "ssn":
                    birView = segue.destination as? BirthDateViewController
            case "rural":
                    rurView = segue.destination as? RuralViewController
            default:
                    resView = segue.destination as? ResidencyViewController
            
            }
        }
        
    }
 

}
