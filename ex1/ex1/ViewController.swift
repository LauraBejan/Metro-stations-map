//
//  ViewController.swift
//  ex1
//
//  Created by Laura on 09/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit
import Foundation
import SQLite3


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
  
    @IBOutlet weak var collectionView: UICollectionView!
    

    
    let peopleImg: [UIImage] = [
        UIImage(named:"1")!,
        UIImage(named:"2")!,
        UIImage(named:"3")!,
        UIImage(named:"4")!,
        UIImage(named:"5")!,
        UIImage(named:"6")!,
        UIImage(named:"7")!,
        UIImage(named:"8")!,
        ]
    
    /*
    
    
    var db: OpaquePointer?
    */
    

  
    var friendsList = [TabBarViewController.Friends]()

    var myBackUpData = ""
   // var friendsList = [Friends]()
 
    var mapList = [TabBarViewController.Friends]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

      //  friendsList.append(tabBar.friendsList[1])
     //   print(friendsList[1])
        collectionView.dataSource=self
        collectionView.delegate=self
        
     //   let indexPath = NSIndexPath(row: 1, section: 1)
    
        let tabBar = tabBarController as! TabBarViewController
        
        let friend: TabBarViewController.Friends
        
        for friend in tabBar.friendsList
        {
            friendsList.append(friend)
        }
     /*   createDatabase()
        
        //addValuesToDb()
        
        readValues()
         */
        
        //STYLING THE CELLS
        let layout = self.collectionView.collectionViewLayout as!
                     UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing=5
        layout.itemSize=CGSize(width:(self.collectionView.frame.size.width-20)/2,
                               height:self.collectionView.frame.size.height/3)
       
 
    
    }
    
    func createFriendList( indexPath: IndexPath)
    {
        let tabBar = tabBarController as! TabBarViewController
        friendsList.append(tabBar.friendsList[indexPath.item])
    }




    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     
        let myData = storyboard?.instantiateViewController(withIdentifier: "FriendsCompleteViewController") as? FriendsCompleteViewController
        
        let friend: TabBarViewController.Friends
        friend = friendsList[indexPath.item]
        myData?.detailName = friend.name!
        myData?.detailSurname = friend.surname!
        myData?.detailPhone = friend.phoneNumber!
        myData?.detailLat = friend.latitude!
        myData?.detailLong = friend.longtiude!
        myData?.detailTown = friend.town!
        myData?.detailStreet = friend.street!
        var myString = String(friend.postcode)
        myData?.detailPostcode = myString
        myString = String(friend.houseNumber)
        myData?.detailHouseNumber = myString
        myString = String(indexPath.item)
        myData?.detailImage = myString
        myBackUpData = myString
        
        
        self.navigationController?.pushViewController(myData!, animated: true)
    }
    
/*    //READ FROM DATABASE
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
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       

        return friendsList.count
    }
    
    func dataMap(indexPath: IndexPath )
    {
      //  let mapDetail = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
       // print("smth")
    //    let map: TabBarViewFriends
    //    map = mapList[indexPath.item]
       // mapDetail?.lat = map.latitude!
       // mapDetail?.long = map.longtiude!
    //    mapDetail?.name = map.name!
        
       // self.navigationController?.pushViewController(mapDetail!, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FriendsCollectionViewCell
        
        
        let friend: TabBarViewController.Friends
        friend = friendsList[indexPath.item]

        
      //  let peopleImg: [UIImage] = [UIImage(named:friend.imgId!)!]
        
        cell.imgFriends.image = peopleImg[indexPath.item]
  
        var fullName: String?
        fullName = friend.surname! + " " + friend.name!
        cell.labelFriends.text = fullName
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 20
        return cell
        
    }
    
}


