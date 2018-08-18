//
//  ViewController.swift
//  ex1
//
//  Created by Laura on 09/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import MapKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
  
    @IBOutlet weak var collectionView: UICollectionView!
  
    var friendsList = [TabBarViewController.Friends]()

    var myBackUpData = ""
    var mapList = [TabBarViewController.Friends]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource=self
        collectionView.delegate=self
        
    
        let tabBar = tabBarController as! TabBarViewController
        
        //ADD VALUES FROM TABBAR
        for friend in tabBar.friendsList
        {
            friendsList.append(friend)
        }

        //STYLING THE CELLS
        let layout = self.collectionView.collectionViewLayout as!
                     UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing=5
        layout.itemSize=CGSize(width:(self.collectionView.frame.size.width-20)/2,
                               height:self.collectionView.frame.size.height/3)
       
 
    
    }

    //PASS DATA TO COMPLETEVIEWCONTROLLER
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsList.count
    }
    
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FriendsCollectionViewCell
        
        
        let friend: TabBarViewController.Friends
        friend = friendsList[indexPath.item]
        
        cell.imgFriends.image = UIImage(named: friend.imgId!)
  
        var fullName: String?
        fullName = friend.surname! + " " + friend.name!
        cell.labelFriends.text = fullName
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 20
        return cell
        
    }
    
}


