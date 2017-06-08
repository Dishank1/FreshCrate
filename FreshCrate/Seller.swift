//
//  Seller.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 13/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Seller: NSObject,MKAnnotation,NSCoding{
    
    private var location: CLLocation?
    private var sellerName: String = ""
    private var sellerLocation: String = ""
    private var sellerRating: String = ""
    private var produces = Array<Dictionary<String, Any>>()
    
    override convenience init()
    {
        self.init(sellerName:"Unknown",sellerRating:"Unknown",sellerLocation:"Unknown",location:nil,produces:[[:]])
    }
    
    required init(coder decoder: NSCoder) {
        //self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
       // self.age = decoder.decodeInteger(forKey: "age")
        self.sellerName = decoder.decodeObject(forKey: "sellerName") as! String
        self.sellerLocation = decoder.decodeObject(forKey: "sellerLocation") as! String
        self.sellerRating = decoder.decodeObject(forKey: "sellerRating") as! String
        print("rrrrrr|\(sellerRating)")
        //self.produces = decoder.decodeObject(forKey: "produces") as! Array<Dictionary<String, Any>>
        //self.produces = decoder.
        //self.produces = decoder.de

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(sellerName, forKey: "sellerName")
        coder.encode(sellerLocation, forKey: "sellerLocation")
        coder.encode(sellerRating, forKey: "sellerRating")
        coder.encode(produces, forKey: "produces")

    }

    init(sellerName:String,sellerRating:String,sellerLocation:String,location:CLLocation?,produces:Array<Dictionary<String, Any>>) {
        super.init()
        self.sellerName = sellerName
        self.sellerRating = sellerRating
        self.sellerLocation = sellerLocation
        self.location = location
        self.produces = produces
    }
    
    func getLocation()->CLLocation
    {
        return location!
    }
    
    func getPrice(fruitName:String)->Double{
        var itemPrice:Double = 0
        for dict in produces{
            if fruitName == dict["itemName"]! as! String
            {
                itemPrice = (dict["itemPrice"]! as! NSString).doubleValue
            }
        }
        return itemPrice
    }
    
    func getItemDescription(fruitName:String)->String{
        var itemDesc:String = ""
        for dict in produces{
            if fruitName == dict["itemName"]! as! String
            {
                itemDesc = dict["description"]! as! String
            }
        }
        return itemDesc
    }
    
    func getName()->String
    {
        return sellerName
    }
    
    var title : String? {
        get {
            return "Seller: \(sellerName)"
        }
    }
    var subtitle : String? {
        get {
            return "Rating: \(sellerRating)"
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return location!.coordinate
        }
    }
    
    func checkProduce(itemName:String)->Seller?{
        
        for dict in produces{
            let produceName = dict["itemName"]! as! String
            if produceName == itemName{
                print("WORKED")
                return self
            }
            else{
                print("Seller has not listed")
                continue
            }
        }
        return nil
    }
    
    override var description: String
    {
        return "sellerName: \(sellerName) \nsellerLocation: \(sellerLocation) \nproduces: \(produces)"
    }
    
}
