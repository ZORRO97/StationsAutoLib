//
//  Model.swift
//  StationsAutoLib
//
//  Created by François LAVAZEC on 04/07/2016.
//  Copyright © 2016 François LAVAZEC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreLocation

func loadStations(completionHandler: (stations: [AutoStation])->()){
    // récupérer les données des AutoLib
        print("essai chargement")
    let urlString =  "http://opendata.paris.fr/api/records/1.0/search/?dataset=stations_et_espaces_autolib_de_la_metropole_parisienne"
    var output = [AutoStation]()

    Alamofire.request(.GET,urlString,parameters : nil)
        .response { (request,response,data,error) in
    
            NSLog("Résultat de la requête reçue")
            if (error == nil && data != nil){
                let json = JSON(data: data!)  // json récupéré
                for (key,subJson):(String,JSON) in json {
                    if key == "records" {
                        print("A nous les données")
                        print(subJson.count)
                        for item in subJson.arrayValue { // syntaxe pour parcourir le tableau
                            // accès aux données de chaque station
                            print("nouvel item")
                             //print(item["fields"]["cp"].stringValue)
                            //print(item["fields"]["id_dsp"].stringValue)
                            let myVille = item["fields"]["ville"].stringValue
                            let myIdDsp = item["fields"]["id_dsp"].stringValue
                            let myIdAutolib = item["fields"]["id_autolib"].stringValue
                            let myAdresse = item["fields"]["adresse"].stringValue
                            let myCp = Int(item["fields"]["cp"].number!)
                            let myTypeStation = item["fields"]["type"].stringValue
                            let myPrisesAutolib = Int(item["fields"]["prises_autolib"].stringValue)!
                            // xy -> array (posx,posy)
                            let myPositionX = Double(item["fields"]["xy"][0].number!)
                            let myPositionY = Double(item["fields"]["xy"][1].number!)
                            let myPosition = CLLocation(latitude: myPositionX, longitude: CLLocationDegrees(myPositionY))
                            print(myVille,myIdDsp,myIdAutolib,myAdresse,myCp,myTypeStation,myPrisesAutolib,myPositionX,myPositionY)
                            print(myPosition.coordinate.latitude)
                            let myStation = AutoStation(ville: myVille, id_dsp: myIdDsp, id_autolib: myIdAutolib, adresse: myAdresse, cp: myCp, typeStation: myTypeStation, prisesAutolib: myPrisesAutolib, position: myPosition)
                            output.append(myStation)
                            
                            
                        }
                    }
                    completionHandler(stations: output)
                }
                
              }
            
    }
}


// récupérer les infos de toutes les stations demandées d'un coup
/*
func getStationsInfo( completionHandler: (stations: [AutoStation])->()){
    // URL spécifique de DECAUD
    // mettre la bonne URL pour AutoLib
    // let urlString = "\(APIURL)/stations?contract=\(APIContract)&apiKey=\(APIKey)"
   let urlString =  "http://opendata.paris.fr/api/records/1.0/search/?dataset=stations_et_espaces_autolib_de_la_metropole_parisienne&facet=ville&facet=cp&facet=type"
    var output = [AutoStation]()
    
    
    NSLog("debut de getStationInfo")
    
    Alamofire.request(.GET, urlString, parameters : nil)
        .response { (request, response, data, error) in
            NSLog("Résultat de la requête reçu")
            if (error == nil && data != nil) {
                
                
                let json = JSON(data: data!) // tableau de json
                
                for index in 0..<json.count {  // ouvre le for
                    
                    var numberStation = 0
                    if let number_station = json[index]["number"].number { // test number
                        numberStation = Int(number_station)
                        
                        if let availableStands = json[index]["available_bike_stands"].number,
                            let available_bikes = json[index]["available_bikes"].number,
                            let description_station = json[index]["name"].string,
                            let lat_position = json[index]["position"]["lat"].number,
                            let lng_position = json[index]["position"]["lng"].number
                        {
                            let position = CLLocation(latitude: CLLocationDegrees(lat_position), longitude: CLLocationDegrees(lng_position))
                            let myStation = VelibStation(numberStation: numberStation, texteStation: description_station, nbBikes: Int(available_bikes), nbPlaces: Int(availableStands))
                            myStation.position = position
                            if  stationIds.indexOf(numberStation) != nil {
                                output.append(myStation)
                            }
                            stations.append(myStation)
                            
                        } else {
                            print("probleme json avec autres données \(json[index])")
                        }
                        // pas de else ce n'est pas un numéro intéressant
                    } else {
                        print("probleme avec \(json[index])")
                    }
                    
                }
                completionHandler(stations: output)
            } else {
                NSLog("error in GetSimpleStation=\(error)")
            }
            
            NSLog("Fin du traitement de la requête")
    }
    NSLog("fonction getStationInfo terminée")
}
*/
