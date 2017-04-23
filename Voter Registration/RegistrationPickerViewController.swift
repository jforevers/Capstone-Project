//
//  RegistrationPickerViewController.swift
//  Voter Registration
//
//  Created by MU IT Program on 4/6/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit
import MicroBlink

class RegistrationPickerViewController: UIViewController, PPScanningDelegate {

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
        self.hideKeyboardWhenTappedAround() 
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
            if (namView?.fname_text.text?.isEmpty)! {
                let alert = UIAlertController(title: "First Name", message: "Please enter your first name.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false
            }
            else if (namView?.lname_text.text?.isEmpty)! {
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
    
    
    @IBAction func ScanLicenseButton(_ sender: AnyObject) {
        
        /** Instantiate the scanning coordinator */
        let error: NSErrorPointer = nil
        let coordinator = coordinatorWithError(error: error)
        
        /** If scanning isn't supported, present an error */
        if coordinator == nil {
            let messageString: String = (error!.pointee?.localizedDescription) ?? ""
            let alertController = UIAlertController(title: "Warning", message: messageString, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Ok", style: .cancel) { _ in }

            alertController.addAction(OKAction)
            
            return
        }
        /** Allocate and present the scanning view controller */
        let scanningViewController: UIViewController = PPViewControllerFactory.cameraViewController(with: self, coordinator: coordinator!, error: nil)
        
        /** Allow autorotation - if it makes sense for your use case */
        let scanController = scanningViewController as! PPScanningViewController
        scanController.autorotate = true
        scanController.supportedOrientations = UIInterfaceOrientationMask.all
        
        /** You can use other presentation methods as well */
        self.present(scanningViewController, animated: true, completion: nil)

    }
    
    func coordinatorWithError(error: NSErrorPointer) -> PPCameraCoordinator? {
        
        /** 0. Check if scanning is supported */
        
        if (PPCameraCoordinator.isScanningUnsupported(for: PPCameraType.back, error: error)) {
            return nil;
        }
        
        
        /** 1. Initialize the Scanning settings */
        
        // Initialize the scanner settings object. This initialize settings with all default values.
        let settings: PPSettings = PPSettings()
        
        
        /** 2. Setup the license key */
        
        // Visit www.microblink.com to get the license key for your app
        settings.licenseSettings.licenseKey = "LD5RZ5JM-YMXTC4BT-ZGPWIVH2-D7KZBNBV-PTDK5RVO-Y2XMNLWG-V3DK4ZR5-XRL7TT56"
        
        /**
         * 3. Set up what is being scanned. See detailed guides for specific use cases.
         * Remove undesired recognizers (added below) for optimal performance.
         */
        
        do { // Remove this if you're not using MRTD recognition
            
            // To specify we want to perform MRTD (machine readable travel document) recognition, initialize the MRTD recognizer settings
            let mrtdRecognizerSettings = PPMrtdRecognizerSettings()
            
            /** You can modify the properties of mrtdRecognizerSettings to suit your use-case */
            
            // tell the library to get full image of the document. Setting this to YES makes sense just if
            // settings.metadataSettings.dewarpedImage = YES, otherwise it wastes CPU time.
            mrtdRecognizerSettings.dewarpFullDocument = false;
            
            // Add MRTD Recognizer setting to a list of used recognizer settings
            settings.scanSettings.add(mrtdRecognizerSettings)
        }
        
        do { // Remove this if you're not using USDL recognition
            
            // To specify we want to perform USDL (US Driver's license) recognition, initialize the USDL recognizer settings
            let usdlRecognizerSettings = PPUsdlRecognizerSettings()
            
            /** You can modify the properties of usdlRecognizerSettings to suit your use-case */
            
            // Add USDL Recognizer setting to a list of used recognizer settings
            settings.scanSettings.add(usdlRecognizerSettings)
        }
        
        do { // Remove this if you're not using UKDL recognition
            
            // To specify we want to perform UKDL (UK Driver's license) recognition, initialize the UKDL recognizer settings
            let eudlRecognizerSettings = PPEudlRecognizerSettings()
            
            /** You can modify the properties of ukdlRecognizerSettings to suit your use-case */
            
            // If you want to save the image of the UKDL, set this to YES
            eudlRecognizerSettings.showFullDocument = true;
            
            // Add UKDL Recognizer setting to a list of used recognizer settings
            settings.scanSettings.add(eudlRecognizerSettings)
        }
        
        do { // Remove this if you're not using MyKad recognition
            
            // To specify we want to perform MyKad recognition, initialize the MyKad recognizer settings
            let myKadRecognizerSettings = PPMyKadRecognizerSettings()
            
            /** You can modify the properties of myKadRecognizerSettings to suit your use-case */
            
            // Add UKDL Recognizer setting to a list of used recognizer settings
            settings.scanSettings.add(myKadRecognizerSettings)
        }
        
        // DISABLE this if you don't need to store images to improve performance!
        settings.metadataSettings.dewarpedImage = true
        
        /** 4. Initialize the Scanning Coordinator object */
        
        let coordinator: PPCameraCoordinator = PPCameraCoordinator(settings: settings, delegate: nil)
        
        return coordinator

    }
    
    func scanningViewControllerUnauthorizedCamera(_ scanningViewController: UIViewController) {
        // Add any logic which handles UI when app user doesn't allow usage of the phone's camera
    }
    
    func scanningViewController(scanningViewController: UIViewController, didFindError error: NSError) {
        // Can be ignored. See description of the method
    }
    
    public func scanningViewController(_ scanningViewController: UIViewController, didFindError error: Error) {
        // Can be ignored
    }
    
    func scanningViewControllerDidClose(_ scanningViewController: UIViewController) {
        // As scanning view controller is presented full screen and modally, dismiss it
        self.dismiss(animated: true, completion: nil)
    }
    
    func scanningViewController(_ scanningViewController: UIViewController?, didOutputResults results: [PPRecognizerResult]) {
        
        // return if we don't have any results
        if (results.count == 0) {
            return
        }
        
        let scanController = scanningViewController as! PPScanningViewController
        
        /**
         * Here you process scanning results. Scanning results are given in the array of PPRecognizerResult objects.
         * Each member of results array will represent one result for a single processed image
         * Usually there will be only one result. Multiple results are possible when there are 2 or more detected objects on a single image (i.e. pdf417 and QR code side by side)
         */
        
        // first, pause scanning until we process all the results
        scanController.pauseScanning()
        
        var message = ""
        var title = ""
        
        // Collect data from the result
        for result in results {
            
            title = "Scan result"
            message = result.description
            
            if (result is PPMrtdRecognizerResult) {
                /** MRTD was detected */
                let mrtdResult = result as! PPMrtdRecognizerResult
                title = "MRTD"
                message = mrtdResult.description
            }
            if (result is PPUsdlRecognizerResult) {
                /** US drivers license was detected */
                let usdlResult = result as! PPUsdlRecognizerResult
                
                let defaults = UserDefaults.standard
                //SAVE USER INFO TO DEVICE
                //Retrieve using defaults.object(forKey:"firstname")
                
                if let firstname = usdlResult.getField(kPPCustomerFirstName){
                    defaults.set(firstname, forKey: "firstname")
                }
                if let lname = usdlResult.getField(kPPCustomerFamilyName){
                    defaults.set(lname, forKey:"lname")
                }
                if let birthDate = usdlResult.getField(kPPDateOfBirth){
                    defaults.set(birthDate, forKey: "date_of_birth")
                }
                if let gender = usdlResult.getField(kPPSex){
                    defaults.set(gender, forKey: "gender")
                }
                if let street_address = usdlResult.getField(kPPAddressStreet){
                    defaults.set(street_address, forKey: "street_address")
                }
                if let city_address = usdlResult.getField(kPPAddressCity){
                    defaults.set(city_address, forKey: "city_address")
                }
                if let state_address = usdlResult.getField(kPPAddressJurisdictionCode){
                    defaults.set(state_address, forKey: "state_address")
                }
                if let zipcode = usdlResult.getField(kPPAddressPostalCode){
                    defaults.set(zipcode, forKey: "zipcode")
                }
                if let license_number = usdlResult.getField(kPPCustomerIdNumber){
                    defaults.set(license_number, forKey: "license_number")
                }
                if let suffix = usdlResult.getField(kPPNameSuffix){
                    defaults.set(suffix, forKey: "suffix")
                }
                if let middle_name = usdlResult.getField(kPPCustomerMiddleName){
                    defaults.set(middle_name, forKey: "mname")
                }
            }
            if (result is PPEudlRecognizerResult) {
                /** EU drivers license was detected */
                let eudlResult = result as! PPEudlRecognizerResult
                title = "EUDL"
                message = eudlResult.description
            }
            if (result is PPMyKadRecognizerResult) {
                /** MyKad was detected */
                let myKadResult = result as! PPMyKadRecognizerResult
                title = "MyKad"
                message = myKadResult.description
            }
        }
        
        // present the alert view with scanned results
        
        let alertController: UIAlertController = UIAlertController.init(title: "Done", message: "Scanning Complete!", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction: UIAlertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default,
                                                         handler: { (action) -> Void in
                                                           self.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(okAction)
        scanningViewController?.present(alertController, animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

    }
    
    func scanningViewController(_ scanningViewController: UIViewController?, didOutputMetadata metadata: PPMetadata) {
        
        if (metadata is PPImageMetadata) {
            
            let result: PPImageMetadata = metadata as! PPImageMetadata
            
            let image: UIImage = result.image()
            
            print("result \(image)")
            
            if (result.name == PPEudlRecognizerSettings.full_DOCUMENT_IMAGE()) {
                print("This image is EUDL full document");
            } else if (result.name == PPMrtdRecognizerSettings.full_DOCUMENT_IMAGE()) {
                print("This image is full Machine readable travel document");
            } else if (result.name == PPMrtdRecognizerSettings.mrz_IMAGE()) {
                print("This image is Machine readable zone");
            } else if (result.name == PPMyKadRecognizerSettings.full_DOCUMENT_IMAGE()) {
                print("This image is full MyKad");
            }
        }
    }
}



