//
//  itemTableVC.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 09/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit

class itemTableVC: UITableViewController {
    
    
    //var selectedFruit:Fruit = Fruit(fruitName: "UNKNOWN")
    var fruitList = Fruits()
    var fruits : [Fruit] {
        get {
            return self.fruitList.fruitList
        }
        set(val) {
            self.fruitList.fruitList = val
        }
    }
    var sellerList = Sellers()
    var sellers : [Seller] {
        get {
            return self.sellerList.sellerList
        }
        set(val) {
            self.sellerList.sellerList = val
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fruit List"
        self.tableView.backgroundColor = UIColor(red:0.80, green:0.92, blue:0.93, alpha:1.0)
       // print("got itemTableVC \(fruits.count)")
       // print("gotseller  itemTableVC \(sellers.count)")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        // Configure the cell...
        let fruit = fruits[indexPath.row]
        cell.textLabel?.text = fruit.title
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "mapSegue", sender: self)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let rowClicked = (self.tableView.indexPathForSelectedRow?.row)!
        
        let fruit = fruits[rowClicked]
        //mapVC.title = fruit.title
        //mapVC.fruit = fruit
        print("\(fruit)")
        
        if let myDestination = segue.destination as? itemMapVC{
            if let itemTableVC = sender as? itemTableVC{
                print("insegue for table to map")
                myDestination.fruitName = fruit.fruitName
                myDestination.title = fruit.fruitName
                myDestination.fruitList = itemTableVC.fruitList
                myDestination.sellerList = itemTableVC.sellerList
            }
        }
    }
    
    
}
