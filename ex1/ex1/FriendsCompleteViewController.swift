//
//  FriendsCompleteViewController.swift
//  ex1
//
//  Created by Laura on 12/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit
import MapKit

class FriendsCompleteViewController: UIViewController {

    @IBOutlet weak var completeImage: UIImageView!
    @IBOutlet weak var completeName: UILabel!
    @IBOutlet weak var completeSurname: UILabel!
    @IBOutlet weak var completePhone: UILabel!
    
    @IBOutlet weak var completeTown: UILabel!
    @IBOutlet weak var completeStreet: UILabel!
    @IBOutlet weak var completeGPS: UILabel!
    @IBOutlet weak var completePostcode: UILabel!
    @IBOutlet weak var completeHouseNumber: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var detailName = ""
    var detailSurname = ""
    var detailPhone = ""
    var detailTown = ""
    var detailStreet = ""
    var detailLat = ""
    var detailLong = ""
    var detailPostcode = ""
    var detailHouseNumber = ""
    var detailImage = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeName.text = detailName
        completeSurname.text = detailSurname
        completePhone.text = detailPhone
        completeTown.text = detailTown
        completeStreet.text = detailStreet
        completeGPS.text = "(" + detailLat + ", " + detailLong + ")"
        completePostcode.text = detailPostcode
        completeHouseNumber.text = detailHouseNumber
        var myInt: Int? = Int(detailImage)
        myInt = myInt! + 1
        detailImage = String(myInt!)
        completeImage.image = UIImage(named: detailImage)
        
        //MAP CARD
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.8, 0.8)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(detailLat)!, Double(detailLong)!)
        let region: MKCoordinateRegion = MKCoordinateRegionMake( location, span)
        mapView.setRegion(region, animated: true)
        
        let mark = MKPointAnnotation()
        
        mark.coordinate = location
        mark.title = completeName.text! + "'s location"
        mapView.addAnnotation(mark)
        // Do any additional setup after loading the view.
    }
    
    
 
    
    @IBAction func goToFullSizeImage(_ sender: Any) {
        
        let myData2 = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController
        
        myData2?.detailImage2 = detailImage
        self.navigationController?.pushViewController(myData2!, animated: true)
        
    //performSegue(withIdentifier: "fullSizeImage", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
