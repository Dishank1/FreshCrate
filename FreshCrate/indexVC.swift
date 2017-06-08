//
//  ViewController.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 08/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit

class indexVC: UIViewController {

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
    
    @IBAction func getStartedButton(_ sender: UIButton) {
        performSegue(withIdentifier: "getStartedSegue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("from vc \(fruits.count)")

        //logoImageView.backgroundColor = UIColor(red:0.80, green:0.92, blue:0.93, alpha:1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let myDestination = segue.destination as? UITabBarController{
            let homeVC =  myDestination.viewControllers![0] as! homeVC
            if let indexVC = sender as? indexVC{
               // print("insegue of indexvc")
                homeVC.fruitList = indexVC.fruitList
                homeVC.sellerList = indexVC.sellerList
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

