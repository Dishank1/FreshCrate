//
//  cartVC.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 15/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit

class cartVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var fruitName:String?
    @IBOutlet weak var tableView: UITableView!
    var selectedFruitSeller: Seller!
    var cartArray: [Seller]!
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

    override func viewWillAppear(_ animated: Bool) {
        //cartArray = UserDefaults.standard.array(forKey: "cart") as? [Seller]!
        
        //print("\(cartArray)")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cartCell")
        if let data = UserDefaults.standard.data(forKey: "cart"),
            let myPeopleList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Seller] {
            print("testting \(myPeopleList)")
            cartArray = myPeopleList
            myPeopleList.forEach({print( $0.getName())})
        } else {
            print("There is an issue")
        }
        //print("gotseller  cartTVC \(fruits.count)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cartArray.count
    }
    
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        var rowToMove = favArray[sourceIndexPath.row]
//        favArray.remove(at: sourceIndexPath.row)
//        favArray.insert(rowToMove, at: destinationIndexPath.row)
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        let item = cartArray[indexPath.row]
        //print("TABLE VIEW\(item.getName())")
        cell.textLabel?.text = "\(item.getName())"
        // Configure the cell...
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
//            favArray.remove(at: indexPath.row)
//            UserDefaults.standard.set(favArray, forKey: "favorites")
//            
//            favTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
