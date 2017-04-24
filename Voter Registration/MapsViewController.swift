//
//  MapsViewController.swift
//  Voter Registration
//
//  Created by Jordan Jones  on 4/8/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround() 
        //Creating a camera view for the maps page
        let camera = GMSCameraPosition.camera(withLatitude: 38.9638 , longitude: -92.3755, zoom: 12.0)
        let mapview = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapview
        
        //Creating a standard marker just to attempt placing pins
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 38.960089, longitude: -92.353501)
        marker.title = "1005 W. Worley St"
        marker.snippet = "Health Dept. Columbia"
        marker.map = mapview
        
        //Because of time constraints creating pins manually by location
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude:38.916344 , longitude:-92.342179)
        marker1.title = "301 W. Green Meadows Rd"
        marker1.snippet = "Rock Bridge Christian Church"
        marker1.map = mapview
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude:38.960685 , longitude:-92.313752)
        marker2.title = "1634 Paris Rd"
        marker2.snippet = "Memorial Baptist Church"
        marker2.map = mapview
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 38.908193, longitude:-92.337477)
        marker3.title = "120 E. Nifong Blvd"
        marker3.snippet = "Peachtree Banquet Center"
        marker3.map = mapview
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 38.951786, longitude:-92.381455)
        marker4.title = "201 S. Fairview Rd"
        marker4.snippet = "Fairview Rd Church of Christ"
        marker4.map = mapview
    }

}
