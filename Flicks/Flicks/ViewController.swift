//
//  ViewController.swift
//  Flicks
//
//  Created by Sheshagiri Haniyur on 3/31/17.
//  Copyright © 2017 Pavani Vellal. All rights reserved.
//

import UIKit
import AFNetworking
import VHUD

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navBar1: UINavigationItem!
    
    @IBOutlet weak var movieTable: UITableView!
    
    @IBOutlet weak var NetworkError: UIView!
    
    @IBOutlet weak var networkErrorMessage: UILabel!
    
    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x:0, y:0, width:350, height:20))
    
    var posts: NSArray = []
    var imgBaseUrl = "http://image.tmdb.org/t/p/w500/"
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.delegate = self
        movieTable.dataSource = self
        movieTable.rowHeight = 110
        
        //        Embeding search bar in navigation bar
        searchBar.placeholder = "Search Movies"
        var leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navBar1.leftBarButtonItem = leftNavBarButton
        //        End of search bar
        
        loadTabContents()
        
        
        //        UI Refresh Control on Pull
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        movieTable.insertSubview(refreshControl, at: 0)
        //        End of UI Refresh Control on pull
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        let post = self.posts[indexPath.row] as? NSDictionary
        
        if let post = self.posts[indexPath.row] as? NSDictionary {
            cell.movieName.text = post.value(forKey: "original_title") as! String?
            cell.movieDesc.text = post.value(forKey: "overview") as! String?
            var imageUrlString  = post.value(forKeyPath: "poster_path") as? String
            imageUrlString = imgBaseUrl + imageUrlString!
            
            if let imageUrl = URL(string: imageUrlString!) {
                cell.movieImg.setImageWith(imageUrl)
            } else {
            }
            
            
            
        } else {
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "DetailViewController2", sender: self)
        self.movieTable.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "DetailViewController2")
        {
            let upcoming: DetailViewController = segue.destination as! DetailViewController
            
            let indexPath = self.movieTable.indexPathForSelectedRow!
            
            let titleString = self.posts[indexPath.row]
            
            if let post = self.posts[indexPath.row] as? NSDictionary {
                upcoming.movieNametxt = post.value(forKey: "original_title") as? String
                upcoming.movieDesctxt = post.value(forKey: "overview") as? String
                upcoming.releaseDatetxt = post.value(forKey: "release_date") as? String
                upcoming.voteAveragetxt = post.value(forKey: "vote_average") as? String
                var imageUrlString  = post.value(forKeyPath: "poster_path") as? String
                imageUrlString = imgBaseUrl + imageUrlString!
                upcoming.imageURLString = imageUrlString
                
                
                
            } else {
                
            }
            
        }
        
    }
    
    
    func loadTabContents()
    {
        let url = URL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=82b549df043e03f91f4b72175a978fb4")
        let request = URLRequest(url: url!)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        var content = VHUDContent(.loop(3.0))
        content.shape = .circle
        content.style = .light
        content.background = .blur(.dark)
        VHUD.show(content)
        
        let task : URLSessionDataTask = session.dataTask(
            with: request as URLRequest,
            completionHandler: { (data, response, error) in
                if let data = data {
                    if let responseDictionary = try! JSONSerialization.jsonObject(
                        with: data, options:[]) as? NSDictionary {
                        // This is how we get the 'posts' field
                        let responseFieldDictionary = responseDictionary["results"] as! NSArray
                        self.posts = responseFieldDictionary
                        self.NetworkError.isHidden = true
                        self.movieTable.reloadData()
                        VHUD.dismiss(1.0, 1.0)
                        
                    } else {
                        // no response from api, handle with network error
                        self.NetworkError.isHidden = false
                        self.movieTable.bringSubview(toFront: self.NetworkError)
                        VHUD.dismiss(1.0, 1.0)
                        self.refreshControl.endRefreshing()
                    }
                }
            

        });
        VHUD.dismiss(1.0, 1.0)
        self.refreshControl.endRefreshing()
        task.resume()
        
        
    }
    
    func pullToRefresh(_: UIRefreshControl) {
        
        loadTabContents()
    }
    
}


    
    
