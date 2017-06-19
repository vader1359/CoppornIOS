//
//  MovieViewController.swift
//  CoppornIOS
//
//  Created by Vader1359 on 6/19/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // List of outlets
    @IBOutlet weak var tableView: UITableView!
    
    
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
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        cell.backgroundColor = .clear
        cell.titleLabel.text = "Wonder Woman"
        cell.overviewLabel.text = "An Amazon princess comes to the world of Man to become the greatest of the female super heroes."
        
        return cell
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
