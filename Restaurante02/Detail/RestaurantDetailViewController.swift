//
//  RestaurantDetailViewController.swift
//  Restaurante02
//
//  Created by CICE on 15/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var restaurantDetailImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapview: MKMapView!
    
    var restaurant: Restaurant!
    var annotation = MKPointAnnotation()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        restaurantDetailImageView.image = UIImage(named: restaurant.image)
        //Modify tableView background color
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/250.0, blue: 240.0/250.0, alpha: 0.2)
        
        //Eliminando las lineas de separacion inferiores
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //Modify Navbar Title
        title = restaurant.name
        
        //Dynamic cell
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Add tap Gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mapShow))
        //Add tap gesture to map
        mapview.addGestureRecognizer(tapGestureRecognizer)
        
        //Geocoding
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) in
            if error != nil{
                //if have error return
                return
            }
            //check if exists responses
            if let placemarksComprobado = placemarks{
                //Store first response
                let placemark = placemarksComprobado[0]
                
                //Create MKPointAnnotation
                
                if let location = placemark.location{
                    //Defining point coordinates
                    self.annotation.coordinate = location.coordinate
                    //Showing point in map
                    self.mapview.addAnnotation(self.annotation)
                    
                    //Define zoom value
                    let region = MKCoordinateRegionMakeWithDistance(self.annotation.coordinate, 200, 200)
                    //Passing zoom value to map
                    self.mapview.setRegion(region, animated: true)
                }
            }
        }
    }
    
    @objc func mapShow(){
        //segue to map view
        performSegue(withIdentifier: "showMap", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //non Hide NavBar on swipe
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        //configure cell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Nombre"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Tipología"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Localización"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Teléfono"
            cell.valueLabel.text = restaurant.phone
        case 4:
            cell.fieldLabel.text = "Visitado"
            cell.valueLabel.text = (restaurant.isVisited) ? "\(restaurant.rating)" : "No visitado"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        
        }
         cell.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/250.0, blue: 240.0/250.0, alpha: 0.2)
        
        return cell
        
        
    }
    //Unwind segue
    @IBAction func closeReview(segue: UIStoryboardSegue){}
    
    //Unwind segue for buttons
    @IBAction func ratingButtonSelected(segue: UIStoryboardSegue){
        //Verify segue ID
        if let rating = segue.identifier{
            restaurant.isVisited = true
            switch rating{
            case "muyBueno":
                restaurant.rating = "Me ha encantado"
            case "regular":
                restaurant.rating = "Ni fú ni fá"
            case "noSirve":
                restaurant.rating = "No sirve"
            default:
                restaurant.rating = ""
            }
        }
    //reload tableView info
        tableView.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get segue identifier to use
        if segue.identifier == "showReview" {
            // Get the new view controller using segue.destinationViewController.
                let destinationController = segue.destination as! ReviewViewController
                // Pass the selected object to the new view controller.
                destinationController.restaurant = restaurant
        }
        if segue.identifier == "showMap" {
            //Sending Reataurant and Annotation
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
            destinationController.annotation = annotation
        }
        
        
    }
    
    /*
     Geocoding
        Forward Geocoding -> direccion a coordenadas
        Reverse Geocoding -> coordenadas a direccion
     1- We need a CLGeocoder object
     2- Pass direction to that object .addresGeocodeString
     3- Process info
     
     Annotation
        Pointer to location "chinchetas"
     -Annotation Object (Data info)
     -Annotation View (view info)
     
     MKPointAnnotation()
     */

}
