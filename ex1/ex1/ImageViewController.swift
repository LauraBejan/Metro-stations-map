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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        fullSizeImage.image = UIImage(named: detailImage2)
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
