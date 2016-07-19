//
//  AutoStation.swift
//  StationsAutoLib
//
//  Created by François LAVAZEC on 05/07/2016.
//  Copyright © 2016 François LAVAZEC. All rights reserved.
//

import Foundation
import CoreLocation

class AutoStation {
    
    var ville: String
    var id_dsp: String
    var id_autolib: String
    var adresse: String
    var cp : Int
    var typeStation: String
    var prisesAutolib: Int
    var nbPlaces: Int?
    var position: CLLocation
    
    var distanceToUser: CLLocationDistance?
    
    func setDistanceToUser(userPosition : CLLocation) {
        
        self.distanceToUser = userPosition.distanceFromLocation(self.position)
    }
    
    
    
    init(ville: String, id_dsp:String, id_autolib: String, adresse: String, cp:Int, typeStation:String, prisesAutolib: Int, position: CLLocation){
        self.ville = ville
        self.id_dsp = id_dsp
        self.id_autolib = id_autolib
        self.adresse =  adresse
        self.cp = cp
        self.typeStation = typeStation
        self.prisesAutolib = prisesAutolib
        self.position = position
    }
 
    
}


