//
//  TabBarViewController.swift
//  ex1
//
//  Created by Laura on 14/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit
import SQLite3

class TabBarViewController: UITabBarController {
    
    var test: Int = 1
    

    var db: OpaquePointer?
    
    class Friends {
        
        var surname: String?
        var name: String?
        var imgId: String?
        var phoneNumber: String?
        var town: String?
        var street: String?
        var houseNumber: Int
        var postcode: Int
        var latitude: String?
        var longtiude: String?
        
        init(surname: String?, name: String?, imgId: String?, phoneNumber: String?, town: String?, street: String?, houseNumber: Int, postcode: Int, latitude: String?, longitude: String?){
            self.surname = surname
            self.name = name
            self.imgId = imgId
            self.phoneNumber = phoneNumber
            self.town = town
            self.street = street
            self.houseNumber = houseNumber
            self.postcode = postcode
            self.latitude = latitude
            self.longtiude = longitude
        }
    }
    
    var myBackUpData = ""
    var friendsList = [Friends]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
     
        addHardCodedData()
        

    }

    func addHardCodedData()
    {
        friendsList.append(Friends(surname: "Anna", name: "Pharis",
                                   imgId: "1", phoneNumber: "0741081390",
                                   town: "Brussels", street: "Quai de l'Industrie",
                                   houseNumber: 5, postcode: 1070,
                                   latitude: "50.8417781", longitude: "4.3228688"))
        
        friendsList.append(Friends(surname: "Kendall", name: "Smith",
                                   imgId: "2", phoneNumber: "0741889880",
                                   town: "Brussels", street: "Montigny-le-Tilleul",
                                   houseNumber: 29, postcode: 2900,
                                   latitude: "50.3816464", longitude: "4.3755300"))
        
        friendsList.append(Friends(surname: "Cezara", name: "Orwin",
                                   imgId: "3", phoneNumber: "0787487390",
                                   town: "Antwerp", street: "Quai de la Niege",
                                   houseNumber: 135, postcode: 2300,
                                   latitude: "51.260197", longitude: "4.402771"))
        
        friendsList.append(Friends(surname: "Aaron", name: "Rowen",
                                   imgId: "4", phoneNumber: "0741168430",
                                   town: "Bruges", street: "Rue de Chien",
                                   houseNumber: 24, postcode: 2000,
                                   latitude: "51.2093", longitude: "3.2247"))
        
        friendsList.append(Friends(surname: "Alexandru", name: "David",
                                   imgId: "5", phoneNumber: "0741095378",
                                   town: "Amsterdam", street: "Rue de la Rennaisance",
                                   houseNumber: 22, postcode: 4800,
                                   latitude: "52.3702", longitude: "4.8952"))
        
        friendsList.append(Friends(surname: "Andrea", name: "Willow",
                                   imgId: "6", phoneNumber: "0741095278",
                                   town: "Ghent", street: "Sint-Baafsplein",
                                   houseNumber: 97, postcode: 2400,
                                   latitude: "51.0543", longitude: "3.7174"))
        
        friendsList.append(Friends(surname: "Maria", name: "Sand",
                                   imgId: "7", phoneNumber: "0742781390",
                                   town: "Ixelles", street: "Avenue Louise",
                                   houseNumber: 106, postcode: 4050,
                                   latitude: "50.8333", longitude: "4.3666"))
        
        friendsList.append(Friends(surname: "Christina", name: "Rosly",
                                   imgId: "8", phoneNumber: "0741081532",
                                   town: "Anderlecht", street: "Rue de la Procession",
                                   houseNumber: 14, postcode: 3000,
                                   latitude: "50.8366", longitude: "4.3082"))
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
