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

    override func viewDidLoad() {
        super.viewDidLoad()

        arrayData = NSMutableArray()
        for i in 0...5 {
            arrayData.add(Person())
            let person = arrayData[i] as! Person
            print(person.mobileNumber)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
