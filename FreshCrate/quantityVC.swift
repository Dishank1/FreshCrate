//
//  quantityVC.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 15/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit

class quantityVC: UIViewController {

    var fruitName:String!
    @IBOutlet weak var fruitTitleLabel: UILabel!
    @IBOutlet weak var fruitDescriptionLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    var selectedFruitSeller: Seller!
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
        self.title = "Add to Cart"
        quantityTextField.text = "0"
        fruitTitleLabel.text = fruitName
        //print("gotseller  itemTableVC \(sellers.count)")
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Added to Cart", message:
            "\(fruitName!) Added to Cart", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        performSegue(withIdentifier: "quantityToCartSegue", sender: self)
       // self.present(alertController, animated: true, completion: nil)
        
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: [selectedFruitSeller])
        UserDefaults.standard.set(encodedData, forKey: "cart")
        print("Therasddsadase is an issue")
        //var array = UserDefaults.standard.array(forKey: "cart") as? [NSDictionary]
//        var array = UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: [Seller]()), forKey: "cart")
//
//        if array != nil{
//            if !(array.contains(selectedFruitSeller as NSDictionary))
//            {
//                
//            }
//            if !(array!.contains(selectedFruitSeller) as NSDictionary){
//                array!.append(selectedFruitSeller)
//                print("here\(array)")
//            }
    
//        }else{
//            array = []
//        }
//        UserDefaults.standard.set(array, forKey: "cart")
    }
    
    @IBAction func quantityStepper(_ sender: UIStepper) {
        quantityTextField.text = Int(sender.value).description
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let myDestination = segue.destination as? cartVC{
            if let quantityVC = sender as? quantityVC{
                print("insegue for quantity to cart")
               myDestination.fruitName = quantityVC.title!
                //myDestination.title = "Add to Cart"
                myDestination.fruitList = quantityVC.fruitList
                myDestination.sellerList = quantityVC.sellerList
                myDestination.selectedFruitSeller = quantityVC.selectedFruitSeller
            }
        }

    }
}
