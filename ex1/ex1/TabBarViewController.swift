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
     
        createDatabase()
        
        //addValuesToDb()
        
        readValues()
        
        // Do any additional setup after loading the view.
    }

    //READ FROM DATABASE
    func readValues(){
        
        //first empty the list of heroes
        friendsList.removeAll()
        
        //this is our select query
        let queryString = "SELECT * FROM Friends"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let surname = String(cString: sqlite3_column_text(stmt, 0))
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let imgId = String(cString: sqlite3_column_text(stmt, 2))
            let phoneNumber = String(cString: sqlite3_column_text(stmt, 3))
            let town = String(cString: sqlite3_column_text(stmt, 4))
            print(town)
            let street = String(cString: sqlite3_column_text(stmt, 5))
            let houseNumber = sqlite3_column_int(stmt, 6)
            let postcode = sqlite3_column_int(stmt, 9)
            let latitude = String(cString: sqlite3_column_text(stmt, 7))
            let longitude = String(cString: sqlite3_column_text(stmt, 8))
            
            //adding values to list
            friendsList.append(Friends(surname: String(describing: surname), name: String(describing: name),
                                       imgId: String(describing: imgId), phoneNumber: String(describing: phoneNumber),
                                       town: String(describing: town), street:String(describing: street),
                                       houseNumber: Int(houseNumber), postcode: Int(postcode),
                                       latitude: String(describing: latitude), longitude: String(describing: longitude)))
            
        }
        
    }
    
    //ADD VALUES
    
    func addValuesToDb()
    {
        let surname = "Ana"
        let name = "Smith"
        let photoId = "1"
        let phone = "0741081350"
        let town = "Brussels"
        let street = "Rue de la Procession"
        let houseNumber = "4"
        let postcode = "1070"
        let gpsCoordinates = "(50.8352675, 4.3017115)"
        var stmt: OpaquePointer?
        
        
        let queryString = "INSERT INTO FriendTabel (surname, name, photoId,phone, town, street, houseNumber, latitude, longitude, postcode) VALUES (?,?,?,?,?,?,?,?,?,?)"
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, surname, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding surname: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, name, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        sqlite3_bind_text(stmt, 3, photoId, -1, nil)
        sqlite3_bind_text(stmt, 4, phone, -1, nil)
        sqlite3_bind_text(stmt, 5, town, -1, nil)
        sqlite3_bind_text(stmt, 6, street, -1, nil)
        sqlite3_bind_text(stmt, 7, houseNumber, -1, nil)
        sqlite3_bind_text(stmt, 8, postcode, -1, nil)
        sqlite3_bind_text(stmt, 9, gpsCoordinates, -1, nil)
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
    }
    
    
    //CREATE/OPEN DATABASE
    func createDatabase() {
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FriendsDatabase.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print(" Can't open the database")
            return
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Friends(surname TEXT, name TEXT, photoId STRING, phone TEXT, town TEXT, street TEXT, houseNumber INT, latitude TEXT, longitude TEXT, postcode INT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Can't create table")
            return
        }
        
        print("Database was created succesfully")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
