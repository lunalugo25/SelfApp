//
//  SAMapVC.swift
//  SelfApp
//
//  Created by jorge luna on 10/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit
import MapKit

class SAMapVC: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    var places = InterestPlace.all()
    let regionRadius: CLLocationDistance = 10000
    let initialLocation = CLLocation(latitude: 19.432608, longitude: -99.133209)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mapa"
        
        mapView.delegate = self
        centerMap(location: initialLocation)
        
        //mapView.addAnnotation(interestPlace)
        mapView.addAnnotations(places)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func centerMap(location:CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.regionRadius * 2.0, self.regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func showDetail(place:InterestPlace) {
        var message = ""
        
        switch place.category {
        case "Escuela":
            message = "Aqui estudie: "
        case "Trabajo":
            message = "Aqui trabaje: "
        default:
            message = ""
        }
        message = message + " " + place.subtitle!
        let alert = UIAlertController(title: place.title, message: message, preferredStyle: .actionSheet)
        let accept = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    }
}

extension SAMapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? InterestPlace {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            view.pinTintColor = annotation.pinColor()
            
            return view
        }
        return nil
    }
}
