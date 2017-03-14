//
//  SAPrincipalTVC.swift
//  SelfApp
//
//  Created by jorge luna on 10/03/17.
//  Copyright © 2017 Jorge Luna. All rights reserved.
//

import UIKit

/*
struct Sections {
    var sectionName : String!
    var sectionObjects : [String]!
}
*/

class SAPrincipalTVC: UITableViewController {

    //var infoPersonal = [String: [String]]()
    //var arraySections = [Sections]()
    var infoPersonal = Personal.all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Jorge"
        /*
        infoPersonal = ["Nombre:": ["Jorge Guillermo Luna Lugo"],"Dirección:": ["Av. Fuentes Brotantes\nCol. Fuentes Brotantes"], "Virtudes:": ["\t- Creativo","\t- Analitico"]]
        
        for (key, value) in infoPersonal {
            arraySections.append(Sections(sectionName: key, sectionObjects: value))
        }
        */
        
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SAPrincipalTVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return infoPersonal.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoPersonal[section].objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SASectionsCell", for: indexPath) as! SectionTableViewCell
        var objectString = infoPersonal[indexPath.section].objects[indexPath.row]
        objectString = objectString.replacingOccurrences(of: "\\t", with: "\t")
        cell.textSection.font = .normal()
        cell.textSection.text = objectString
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return infoPersonal[section].name
    }
    /*
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return (section == infoPersonal.count) ?"" : " "
    }
    */
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = .clear
    }
    /*
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.backgroundColor = .clear
    }
    */
}
