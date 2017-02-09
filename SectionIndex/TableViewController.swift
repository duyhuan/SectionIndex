//
//  TableViewController.swift
//  SectionIndex
//
//  Created by techmaster on 1/18/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayData: NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrayKey: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.tableView.sectionIndexBackgroundColor = UIColor.gray /* change section index background color */
        self.tableView.sectionIndexColor = UIColor.white /* change section index color (A...B...C...) */

        arrayData = NSMutableArray()
        for _ in 0..<60 {
            arrayData.add(Person())
        }
        
        for element in arrayData {
            let person = element as! Person
            var firstLetter: String = (person.firstName as NSString).substring(to: 1)
            
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            
            var arrayForLetter: NSMutableArray!
            
            if dictContacts.value(forKey: firstLetter) != nil {
                arrayForLetter = dictContacts.value(forKey: firstLetter) as! NSMutableArray
                arrayForLetter.add(person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            } else {
                arrayForLetter = NSMutableArray(object: person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
        }
        
        arrayKey = dictContacts.allKeys as! [String]
        arrayKey = arrayKey.sorted()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayKey.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionTitle = arrayKey[section]
        let sectionPersons = dictContacts[sectionTitle] as! NSArray
       return sectionPersons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrayKey
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.gray
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle] as! NSArray
        
        let person = sectionPersons[indexPath.row] as! Person
        
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.mobileNumber
        
        return cell!
    }
    
    // MARK - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle] as! NSArray
        
        let person = sectionPersons[indexPath.row] as! Person
        
        detailVC.person = person
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
