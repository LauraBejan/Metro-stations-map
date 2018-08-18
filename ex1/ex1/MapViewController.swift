//
//  MapViewController.swift
//  ex1
//
//  Created by Laura on 14/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate , MKMapViewDelegate{
    
    @IBOutlet weak var myMap: MKMapView!
    
    var friendsList = [TabBarViewController.Friends]()
    
    var tracker = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracker.delegate = self
        tracker.desiredAccuracy = kCLLocationAccuracyBest
        
        if (CLLocationManager.locationServicesEnabled())
        {

            tracker.requestAlwaysAuthorization()
            tracker.startUpdatingLocation()
        }
        
        let tabBar = tabBarController as! TabBarViewController
 
        for friend in tabBar.friendsList
        {
            friendsList.append(friend)
        }
        
        addMarksOnMap()
        
    }
    
    func addMarksOnMap()
    {
        //MAP CARD
        
         let span:MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
        
        for friend in friendsList
        {
            let myLat = Double(friend.latitude!)
            let myLong = Double(friend.longtiude!)
            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat!, myLong!)
            let region: MKCoordinateRegion = MKCoordinateRegionMake( location, span)
            myMap.setRegion(region, animated: true)
        
            let mark = MKPointAnnotation()
        
            mark.coordinate = location
            mark.title = friend.surname! + "'s location"
            myMap.addAnnotation(mark)
        }
        

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
