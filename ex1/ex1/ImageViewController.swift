//
//  ImageViewController.swift
//  ex1
//
//  Created by Laura on 13/08/2018.
//  Copyright © 2018 Laura. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var fullSizeImage: UIImageView!
    
    var detailImage2 = ""
    
    //var mainViewController:ViewController?
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   print(mydetailImage)
       // var myInt: Int? = Int(mydetailImage)
       // myInt = myInt! + 1
      //  mydetailImage = String(myInt!)
        print(detailImage2)

        
        fullSizeImage.image = UIImage(named: detailImage2) //UIImage(named: mydetailImage)

        
        
        // Do any additional setup after loading the view.
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
