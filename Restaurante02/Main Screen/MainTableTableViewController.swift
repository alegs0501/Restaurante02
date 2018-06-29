//
//  MainTableTableViewController.swift
//  Restaurante02
//
//  Created by CICE on 8/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import UIKit

class MainTableTableViewController: UITableViewController {
    
    
    var restaurants: [Restaurant] = [Restaurant(name: "Vips", type: "Cafetería", location: "Calle Maldonado 35, Madrid, España", image: "resta001", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Ginos", type: "Bar", location: "Collado de Marichiva 5, Madrid", image: "resta002", isVisited: false, phone: "634 57 68 79"),
                                      Restaurant(name: "Zalacaín", type: "Restaurante", location: "Zaragoza", image: "resta003", isVisited: false, phone: "686 79 47 56"),
                                      Restaurant(name: "Diverxo", type: "Cafetería", location: "Santander", image: "resta004", isVisited: false, phone: "667 00 33 43"),
                                      Restaurant(name: "La Bola", type: "Restaurante", location: "Málaga", image: "resta005", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Tanteo", type: "Bar", location: "Vigo", image: "resta006", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Daltea", type: "Restaurante", location: "Santander", image: "resta007", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Plaza", type: "Cafetería", location: "Vigo", image: "resta008", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Rotonda", type: "Restaurante", location: "Madrid", image: "resta009", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Fridays", type: "Cafetería", location: "Málaga", image: "resta0010", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Opera", type: "Bar", location: "Santander", image: "resta0011", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Camión", type: "Cafetería", location: "Madrid", image: "resta0012", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Panza", type: "Bar", location: "Madrid", image: "resta0013", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Sancho", type: "Restaurante", location: "Vigo", image: "resta0014", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "La casa de Pi", type: "Cafetería", location: "Madrid", image: "resta0015", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Catorce", type: "Restaurante", location: "Málaga", image: "resta0016", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "El Camino", type: "Cafetería", location: "Madrid", image: "resta0017", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Aperitivo", type: "Bar", location: "Madrid", image: "resta0018", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Rico rico", type: "Cafetería", location: "Santander", image: "resta0019", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Arguiñano", type: "Bar", location: "Vigo", image: "resta0020", isVisited: false, phone: "667 95 03 43"),
                                      Restaurant(name: "Dani García", type: "Bar", location: "Málaga", image: "resta0021", isVisited: false, phone: "667 95 03 43")]
    
    
    //Array visited
    var restaurantIsvisited = Array(repeating: false, count: 21)
    
    //Unwind segue
    @IBAction func closeAddRestaurant(segue: UIStoryboardSegue){}
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //Delete back button text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        
        //Dynamic cell
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Hide NavBar on swipe
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell

        //Configure the cell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.thumbnailImageView.layer.cornerRadius = 15.0
        cell.thumbnailImageView.clipsToBounds = true
        //Put a checkmark if restaurant is visited
       /* if restaurants[indexPath.row] {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }*/
        

        return cell
    }
    
    /*override var prefersStatusBarHidden: Bool{
        return true
    }*/
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //Alerta
        let alert = UIAlertController(title: "Aviso!", message: "¿Qué desea hacer?", preferredStyle: .alert)
            //Cancel Button
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (actionCancel) in
            print("Se ha cancelado la acción")
        }
            //OK Button
        let okAction = UIAlertAction(title: "OK", style: .default) { (actionOk) in
            print("Se ha seleccionado OK")
        }
            //Check-in Button
        let checkin = UIAlertAction(title: "Check-in", style: .default, handler: { (actioncheckin) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantIsvisited[indexPath.row] = true
            })
        let uncheck = UIAlertAction(title: "Check-Out", style: .default, handler: { (actioncheckin) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            self.restaurantIsvisited[indexPath.row] = false
        })
        
        if restaurantIsvisited[indexPath.row] {
            alert.addAction(uncheck)
        
        } else {
            alert.addAction(checkin)
            
        }
        
       
        //alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true) {
            print("Alerta mostrada")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }*/
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //Delete data
            restaurants.remove(at: indexPath.row)
        }
        //Reloading data
        //tableView.reloadData()
        //Deleting a cell, this method reload data too
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            //Social sharing buttons
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            //Actions to commit
            //Text to share on social web
            let postText = "I have been at \(self.restaurants[indexPath.row].name)"
            let activityController = UIActivityViewController(activityItems: [postText], applicationActivities: nil)
            self.present(activityController, animated: true)
        }
        
            //Delete Action
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        //Custom action
        shareAction.backgroundColor = UIColor(red: 71.0/255.0, green: 182.0/255.0, blue: 214.0/255.0, alpha: 1)
        return [deleteAction, shareAction]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get segue identifier to use
        if segue.identifier == "showRestaurantDetail" {
            // Get the new view controller using segue.destinationViewController.
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantDetailViewController
                // Pass the selected object to the new view controller.
                destinationController.restaurant = restaurants[indexPath.row]
             
                
            }
            
            
        }
       
        
    }
    

}
