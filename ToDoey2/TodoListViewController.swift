//
//  ViewController.swift
//  ToDoey2
//
//  Created by Rebecca Clarke on 7/22/18.
//  Copyright © 2018 Rebecca Clarke. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Buy eggs", "Buy milk", "Buy Bread"]
    
    let defaults = UserDefaults.standard   //one option for saving small bits of data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //? is optional  ! is forced downcast
        // use if let so that if there is a typo in the key, it won't crash
        if let items = defaults.array(forKey: "ToDoListArray") as? [String]{
            itemArray = items
        }
        
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
    
    //add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //popup UIAlert controller
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Add Item", style: .default){ (action) in
            //what wil happen when user clicks the add button
            //print(textField.text)
            
            //self because we are inside an 'in'. we have to tell it explicitly where the itemArray exists (inside the current class
            self.itemArray.append(textField.text!) //forceunwrap is ok because a text field will never be nil.  it could be an empty string, but that's ok
            // if we want a default value in case they leave it blank, it would be:
            //itemArray.append(textField.text ?? "New Item")
            //better to prevent it going through if empty
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray") //self because we are inside enclosure
            
            self.tableView.reloadData()
            
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
            //print(alertTextField.text)
        }
        present(alert, animated: true, completion: nil)
        
    }
    
}

