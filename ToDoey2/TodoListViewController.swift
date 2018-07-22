//
//  ViewController.swift
//  ToDoey2
//
//  Created by Rebecca Clarke on 7/22/18.
//  Copyright © 2018 Rebecca Clarke. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray = ["Buy eggs", "Buy milk", "Buy Bread"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListItem", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //tableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)  //makes it gray for a second when selected instead of remaining gray until another is selected
        //give it a checkmark as an accessory
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            //change it to none
            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }

}

