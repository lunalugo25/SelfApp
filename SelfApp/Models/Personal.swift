//
//  Personal.swift
//  SelfApp
//
//  Created by jorge luna on 14/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import Foundation

class Personal {
    
    var name: String
    var objects: [String]
    
    class func all() -> [Personal] {
        var sections = [Personal]()
        if let URL = Bundle.main.url(forResource: "Personal", withExtension: "plist") {
            if let infoFromPlist = NSDictionary(contentsOf: URL) {
                for element in infoFromPlist.allKeys {
                    let name = element as? String
                    let objects = infoFromPlist[element] as? [String]
                    let info = Personal(name: name!, objects: objects!)
                    sections.append(info)
                }
            }
        }
        return sections.reversed()
    }
    
    init(name: String, objects: [String]) {
        self.name = name
        self.objects = objects
    }
}
