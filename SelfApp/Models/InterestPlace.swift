//
//  InterestPlace.swift
//  SelfApp
//
//  Created by jorge luna on 11/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit
import MapKit

class InterestPlace: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let category: String
    let coordinate: CLLocationCoordinate2D
    
    class func all() -> [InterestPlace] {
        var places = [InterestPlace]()
        if let URL = Bundle.main.url(forResource: "Places", withExtension: "plist") {
            if let placesFromPlist = NSArray(contentsOf: URL) {
                for dictionary in placesFromPlist {
                    let place = InterestPlace(dictionary: dictionary as! NSDictionary)
                    places.append(place)
                }
            }
        }
        return places
    }
    
    init(title: String, subtitle: String, category: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.category = category
        self.coordinate = coordinate
    }
    
    convenience init(dictionary: NSDictionary) {
        guard let title = dictionary["title"] as? String,
            let subtitle = dictionary["subtitle"] as? String,
            let category = dictionary["category"] as? String,
            let latitude = dictionary["latitude"] as? NSNumber,
            let longitude = dictionary["longitude"] as? NSNumber else {
                self.init(title: "México", subtitle: "Lindo y querido", category: "Pais", coordinate: CLLocationCoordinate2D(latitude: 19.432608, longitude: -99.133209))
                return
        }
        self.init(title: title, subtitle: subtitle, category: category, coordinate:
            CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude)))
    }
    
    func pinColor() -> UIColor  {
        switch category {
        case "Escuela":
            return .blue
        case "Trabajo":
            return .red
        case "Casa":
            return .green
        case "Curso":
            return .purple
        default:
            return .green
        }
    }
}
