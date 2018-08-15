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
    
    let tracker = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tracker.delegate = self
        tracker.desiredAccuracy = kCLLocationAccuracyBest
        tracker.requestWhenInUseAuthorization()
        tracker.startUpdatingLocation()
        
        let devicelatitude = (tracker.location?.coordinate.latitude)!
        let devicelongitude = (tracker.location?.coordinate.longitude)!
        print(devicelatitude)
        print(devicelongitude)
        
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
        
        let userLocation = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
     //   print(userLocation.coordinate.latitude)
     //   print(userLocation.coordinate.longitude)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake( location, span)
        myMap.setRegion(region, animated: true)
        
        self.myMap.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
