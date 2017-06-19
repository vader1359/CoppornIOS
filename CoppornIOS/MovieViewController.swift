//
//  MovieViewController.swift
//  CoppornIOS
//
//  Created by Vader1359 on 6/19/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit
import AFNetworking

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // List of outlets
    @IBOutlet weak var tableView: UITableView!
    
    // List of global variables
    var movieList = [Movie]()
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row % 2) == 0 {
            
            let cellLeft = tableView.dequeueReusableCell(withIdentifier: "movieCellLeft") as! MovieCellLeft
            
            cellLeft.backgroundColor = .clear
            cellLeft.titleLabel.text = movieList[indexPath.row].title
            cellLeft.overviewLabel.text = movieList[indexPath.row].overview
            
            let posterURL = NSURL(string: movieList[indexPath.row].posterURL)! as URL
            cellLeft.posterImg.setImageWith(posterURL)

            return cellLeft
        } else {
            
            let cellRight = tableView.dequeueReusableCell(withIdentifier: "movieCellRight") as! MovieCellRight
            
            cellRight.backgroundColor = .clear
            cellRight.titleLabel.text = movieList[indexPath.row].title
            cellRight.overviewLabel.text = movieList[indexPath.row].overview
            
            let posterURL = NSURL(string: movieList[indexPath.row].posterURL)! as URL
            cellRight.posterImg.setImageWith(posterURL)
            
            return cellRight
        }
        
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
