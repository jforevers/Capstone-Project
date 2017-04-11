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
        //Creating a camera view for the maps page
        let camera = GMSCameraPosition.camera(withLatitude: 38.9638 , longitude: -92.3755, zoom: 4.0)
        let mapview = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapview
        
        //Creating a standard marker just to attempt placing pins
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 38.9517, longitude: -92.3341)
        marker.title = "Columbia"
        marker.snippet = "Missouri"
        marker.map = mapview
    }

}
