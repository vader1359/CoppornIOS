//
//  DetailsViewController.swift
//  CoppornIOS
//
//  Created by Vader1359 on 6/18/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit
import AFNetworking

class DetailsViewController: UIViewController {
    
    // List of outlets
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // List of global variables
    var imgURL = ""
    var overview = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        posterImg.setImageWith(NSURL(string: imgURL) as! URL)
        overviewLabel.text = overview
        
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
