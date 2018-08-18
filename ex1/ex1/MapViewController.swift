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
        
            let mark = MKPointAnnotation()
        
            mark.coordinate = location
            mark.title = friend.surname! + "'s location"
            myMap.addAnnotation(mark)
        }
        

    }
    

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
