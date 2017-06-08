//
//  itemMapVC.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 13/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class itemMapVC: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    var fruit:Fruit!
    var selectedFruitSeller = Seller()
    //var fruitList = Fruits()
    var manager = CLLocationManager()
    var fruitName:String!
    //var sellers : [Seller] = []
    //var fruits : [Fruit] =
    var produces = Array<Dictionary<String, Any>>()

    @IBOutlet weak var mapView: MKMapView!
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
        for seller:Seller in sellers{
            if((seller.checkProduce(itemName: self.title!)) != nil)
            {
                let region = MKCoordinateRegionMakeWithDistance(seller.coordinate, 5000, 5000)
                mapView.setRegion(region, animated: true)
                mapView.addAnnotation(seller as MKAnnotation)
                //selectedFruitSellers.append(seller)
            }
        }
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            manager.startUpdatingLocation()
           // startUpdating()
        }
        mapView.delegate = self
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        manager.startUpdatingLocation()
    }
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
    //indicatorView.stopAnimating()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view: MKPinAnnotationView
        let identifier = "Pin"
        
        if annotation is MKUserLocation{
            return nil
        }
        if annotation !== mapView.userLocation{
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
                dequeuedView.annotation = annotation
                view = dequeuedView
            }else{
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.pinTintColor = MKPinAnnotationView.purplePinColor()
                view.animatesDrop = true
                view.canShowCallout = true
                let leftButton = UIButton(type: .detailDisclosure)
                let rightButton = UIButton(type: .detailDisclosure)
                leftButton.tag = 0
                rightButton.tag = 1
                //view.leftCalloutAccessoryView = leftButton
                view.rightCalloutAccessoryView = rightButton
            }
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let sellerAnnotation = view.annotation as! Seller
        let sellerName = view.annotation?.title
        switch control.tag{
        case 0:
           // let geocoder = CLGeocoder()
            //            //let coordinate = manager.location?.coordinate
            //            let location = CLLocation(latitude: sellerAnnotation.getLocation().coordinate.latitude, longitude: sellerAnnotation.getLocation().coordinate.longitude)
            //            geocoder.reverseGeocodeLocation(location, completionHandler:{(placemarks:[CLPlacemark]?,error:Error?)->Void in
            //
            //                if let placemark = placemarks?[0]{
            //                    let place = MKPlacemark(placemark: placemark)
            //                    let mapItem = MKMapItem(placemark: place)
            //                    let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
            //                    mapItem.openInMaps(launchOptions: options)
            //                }
            //            })

            break
            
        case 1:
            selectedFruitSeller = sellerAnnotation
            print("my case1\(selectedFruitSeller)")
            performSegue(withIdentifier: "mapToQuantitySegue", sender: self)

                   default:
            break
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let myDestination = segue.destination as? quantityVC{
            if let itemMapVC = sender as? itemMapVC{
                print("insegue for table to map")
                myDestination.fruitName = itemMapVC.title!
                //myDestination.title = "Add to Cart"
                myDestination.fruitList = itemMapVC.fruitList
                print("in mapvc com\(itemMapVC.fruitList.fruitList.count)")
                myDestination.sellerList = itemMapVC.sellerList
                myDestination.selectedFruitSeller = itemMapVC.selectedFruitSeller
            }
        }

    }
    
}
