//
//  Application.swift
//  SelfApp
//
//  Created by jorge luna on 13/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit

class Application {
    
    var name: String
    var company: String
    var description: String
    var challenge: String
    var url: String
    var image: UIImage
    var frameworks: [String]
    
    class func all() -> [Application] {
        var applications = [Application]()
        if let URL = Bundle.main.url(forResource: "Apps", withExtension: "plist") {
            if let appsFromPlist = NSArray(contentsOf: URL) {
                for dictionary in appsFromPlist {
                    let app = Application(dictionary: dictionary as! NSDictionary)
                    applications.append(app)
                }
            }
        }
        return applications
    }
    
    init(name: String, company: String, description: String, challenge: String, url: String,image: UIImage, frameworks: [String]) {
        self.name = name
        self.company = company
        self.description = description
        self.challenge = challenge
        self.url = url
        self.image = image
        self.frameworks = frameworks
    }
    
    convenience init(dictionary: NSDictionary) {
        let name = dictionary["name"] as? String
        let company = dictionary["company"] as? String
        let description = dictionary["description"] as? String
        let challenge = dictionary["challenge"] as? String
        let url = dictionary["url"] as? String
        let imageName = dictionary["image"] as? String
        let image = UIImage(named: imageName!)
        let frameworks = dictionary["frameworks"] as? [String]
        self.init(name: name!, company: company!, description: description!, challenge: challenge!, url: url!, image: image!, frameworks: frameworks!)
    }
}
