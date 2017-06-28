//
//  AppDelegate.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 08/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var fruits : [Fruit] = []
    var sellers : [Seller] = []


    func loadData(){
        if let path = Bundle.main.path(forResource: "data", ofType: "plist"){
            let tempDict = NSDictionary(contentsOfFile: path)
            //print(tempDict?.count)
            
            let fruitArray = (tempDict!.value(forKey:"fruits")as! NSArray) as Array
            print(fruitArray.count)
            
            let vegArray = (tempDict!.value(forKey:"vegetables")as! NSArray) as Array
            print(vegArray.count)
            
            let sellerArray = (tempDict!.value(forKey:"sellers")as! NSArray) as Array
            
            for eachFruit in fruitArray{
                let fruitObj = Fruit(fruitName: eachFruit as! String)
                fruits.append(fruitObj)
            }
            
            for dict in sellerArray{
                let sellerName = dict["sellerName"]! as! String
                let sellerLocation = dict["sellerLocation"]! as! String
                let sellerRating = dict["sellerRating"]! as! String
                let latitude = (dict["sellerLatitude"]! as! NSString).doubleValue
                let longitude = (dict["sellerLongitude"]! as! NSString).doubleValue
                let location = CLLocation(latitude: latitude,longitude: longitude)
                let produces = (dict["produces"]! as! NSArray) as! Array<Dictionary<String, Any>>
                for testing in produces{
                    let itemNameTest = testing["itemName"]! as! String
                    //print("item name is \(itemNameTest)")
                }
                let s = Seller(sellerName: sellerName,sellerRating: sellerRating, sellerLocation: sellerLocation, location: location,produces: produces)
               // print("sell \(s)")
                sellers.append(s)
            }
            // print("There are \(fruits.count) fruits")
            //print("\(fruits)")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool{
            loadData()
            let rootVC = window?.rootViewController! as? indexVC
            let fruitList = Fruits()
            let sellerList = Sellers()
            fruitList.fruitList = fruits
            sellerList.sellerList = sellers
            rootVC?.fruitList = fruitList
            rootVC?.sellerList = sellerList
            return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

