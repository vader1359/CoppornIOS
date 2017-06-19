//
//  SplashViewController.swift
//  CoppornIOS
//
//  Created by Vader1359 on 6/19/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit
import AVFoundation
import AFNetworking


class SplashViewController: UIViewController {
    // List of outlets
    @IBAction func goBtn(_ sender: Any) {
        performSegue(withIdentifier: "mainScreen", sender: self)
        
    }
    
    
    // List of Variables
    var results = [NSDictionary]()
    var movieList = [Movie]()
    
    let posterBaseURL = "http://image.tmdb.org/t/p/w500"
    
    // AVPlayer variables
    
    
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        // Load the video and control it
        
        let theFile = Bundle.main.url(forResource: "itVideo", withExtension: "mp4")
        avPlayer = AVPlayer(url:theFile!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        // This set the size and position of AVPlayer
        avPlayerLayer.frame = view.layer.bounds
        // The background color will be setup at storyboard to control the alpha
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        
        
        // FIXME: NEED LOOK BACK - What is this?????
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
        fetchMovies()
        
        
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }
    override func viewDidDisappear(_ animated:Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let nextVC = segue.destination as! MovieViewController
        nextVC.movieList = movieList
        
        
    }
    
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
                                    if let responseDictionary = try! JSONSerialization.jsonObject(
                                        with: data, options:[]) as? NSDictionary {
                                        self.results = responseDictionary["results"] as! [NSDictionary]
                                        
                                        for result in self.results {
                                            let title = result["title"] as! String
                                            let overview = result["overview"] as! String
                                            
                                            let posterPath = result["poster_path"] as! String
                                            let posterURL = self.posterBaseURL + posterPath
                                            
                                            
                                            let movie = Movie(title: title, overview: overview, posterURL: posterURL)
                                            self.movieList.append(movie)
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                }
            })
        task.resume()
    }
    
    
    
    
}
