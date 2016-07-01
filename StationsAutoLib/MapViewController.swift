//
//  MapViewController.swift
//  StationsAutoLib
//
//  Created by François LAVAZEC on 29/06/2016.
//  Copyright © 2016 François LAVAZEC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView : MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func localizationPressed(){
        print("localisation demandée")
    }
    
    @IBAction func segmentedControlChanged(){
        print("changement de segmented control")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // TODO: sélection au départ du segmented control
        segmentedControl.selectedSegmentIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
