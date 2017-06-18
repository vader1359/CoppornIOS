//
//  MovieViewController.swift
//  CoppornIOS
//
//  Created by Vader1359 on 6/18/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit
import AFNetworking

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // List of Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // List of Global Variables
    var movies = [NSDictionary]()
    let posterBaseUrl = "http://image.tmdb.org/t/p/w500"
    
    var selectedURL = ""
    var selectedOverview = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchMovies()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Must set this as the length of the arrays, or error Out Of Range
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This variable connect the cell with the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        // Here we can set the property of cell based on the MovieCell class
        //        cell.posterImg
        cell.titleLabel.text = movies[indexPath.row]["title"] as! String
        cell.overviewLabel.text = movies[indexPath.row]["overview"] as! String
        
        // Set up the image with AFNetworking
        if let posterPath = movies[indexPath.row]["poster_path"] as? String {

            cell.posterImg.setImageWith(URL(string: posterBaseUrl + posterPath)!)
        }
        else {
            // No poster image. Can either set to nil (no image) or a default movie poster image
            // that you include as an asset
            cell.posterImg.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedURL = self.posterBaseUrl + (movies[indexPath.row]["poster_path"] as! String)
        self.selectedOverview = movies[indexPath.row]["overview"] as! String
        
        // What is this for?
        // FIXME: NEED LOOK BACK - What is the purpose of this?
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
    
    
    // This function must be inside the class for the global variable to work
    func fetchMovies() {
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = URLRequest(
            url: url!,
            cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        let task: URLSessionDataTask =
            session.dataTask(with: request,
                             completionHandler: { (dataOrNil, response, error) in
                                if let data = dataOrNil {
                                    // Get the whole response as jsonObject and convert it to an NSDictionary
                                    if let responseDictionary = try! JSONSerialization.jsonObject(
                                        with: data, options:[]) as? NSDictionary {
                                        // Use the global variables to store the favourite results based on key
                                        self.movies = responseDictionary["results"] as! [NSDictionary]
                                        // Need this to reload the table after fetching
                                        self.tableView.reloadData()
                                        
                                        
                                    }
                                }
            })
        task.resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        // Set the next VC
        let nextVC = segue.destination as! DetailsViewController
        nextVC.imgURL = selectedURL
        nextVC.overview = selectedOverview
        
        
     }
    
    
    
    
}





