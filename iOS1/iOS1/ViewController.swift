//
//  ViewController.swift
//  iOS1
//
//  Created by Laura on 09/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let peopleNames=["Ana","Mary","Leo","Armin","Celia","Zoe","David","Cezara"]
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource=self
        collectionView.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peopleNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FriendsCollectionViewCell
   
        cell.nameLabel.text=peopleNames[indexPath.item]
        cell.friendsImg.image=peopleImg[indexPath.item]
        
        return cell
    
    }

}

