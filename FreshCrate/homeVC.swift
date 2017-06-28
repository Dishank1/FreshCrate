//
//  homeVC.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 09/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
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
    
    @IBAction func itemType(_ sender: UIButton) {
        performSegue(withIdentifier: "segueFromHomeVCToTableVC", sender: self)
    }

       override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let navVC = segue.destination as? UINavigationController{
            let tableVC = navVC.viewControllers[0] as! itemTableVC
            if let homeVC = sender as? homeVC{
                print("insegue of homevc")
                print("iden\(String(describing: segue.identifier))")
                tableVC.fruitList = homeVC.fruitList
                tableVC.sellerList = homeVC.sellerList
            }
        }
    }
}
