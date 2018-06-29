//
//  MapViewController.swift
//  Restaurante02
//
//  Created by CICE on 29/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var restaurant: Restaurant!
    var annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Define mapView´s delegate
        mapView.delegate = self

        // Do any additional setup after loading the view.
        annotation.title = restaurant.name
        annotation.subtitle = restaurant.type
        mapView.addAnnotation(annotation)
        //Define zoom value
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 400, 400)
        //Passing zoom value to map
        mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //Create an id for point annotation
        let identifier = "MiChincheta"
        
        //Verifying if is user location point
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        //Modifying points
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        //Verifying if exists
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.animatesDrop = true
            
        }
        //Defining points attributes
        let restaurantImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        restaurantImage.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = restaurantImage
        
        return annotationView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
