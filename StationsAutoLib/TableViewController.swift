//
//  TableViewController.swift
//  StationsAutoLib
//
//  Created by François LAVAZEC on 29/06/2016.
//  Copyright © 2016 François LAVAZEC. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet var carsTableView : UITableView!
    
    var myStations =  [AutoStation]()

    override func viewDidLoad() {
        loadStations(){myStations in
            self.myStations = myStations   // récupération des données
            self.carsTableView.reloadData() // maj de la tableview
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

// MARK: - TableView
extension TableViewController : UITableViewDelegate, UITableViewDataSource {
 func numberOfSectionsInTableView(tableView: UITableView) -> Int {
 // Return the number of sections.
 return 1
 }

 func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
Int {
 // A modifier, retourner le nombre de ligne dans la section
    // indiquer le nb de lignes à afficher
 return myStations.count
 }

 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
 // Ajouter la logique d'affichage du texte dans la cellule de la TableView
 // la variable indexpath.row indique la ligne selectionnée
 // on accède aux IBOutlet de la cellule avec par exemple : cell.name =
    cell.nameLabel.text  = myStations[indexPath.row].id_autolib
    cell.carLabel.text = "\(myStations[indexPath.row].prisesAutolib) P"
    cell.placesLabel.text = "distance" // mettre la distance géolocalisée
 return cell
 }

 func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

 let selectedRow = indexPath.row
 //faire quelque chose avec selectedRow
    print(selectedRow)

 tableView.deselectRowAtIndexPath(indexPath, animated: false)
 }
}