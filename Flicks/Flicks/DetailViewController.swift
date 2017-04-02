//
//  DetailViewController.swift
//  Flicks
//
//  Created by Sheshagiri Haniyur on 4/1/17.
//  Copyright © 2017 Pavani Vellal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageURLString: String? = "NoImage"
    var movieNametxt: String? = "No Movie name"
    var movieDesctxt: String? = "No Movie description"
    var releaseDatetxt: String? = "Date"
    var voteAveragetxt: String? = "no vote"
    var durationtxt: String? = "No Movie description"
    

    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var DetailScroll: UIScrollView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDesc: UITextView!
    @IBOutlet weak var releasedate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageUrl = URL(string: imageURLString!) {
            movieImage.setImageWith(imageUrl)
        } else {
        }
        
        movieName.text = movieNametxt
        movieDesc.text = movieDesctxt
        movieDesc.sizeToFit()

        DetailScroll.contentSize = CGSize(width: DetailScroll.frame.width, height: DetailScroll.frame.height+20)
        
//        let formatter = DateFormatter()
//        formatter.dateStyle = DateFormatter.Style.long
        releasedate.text = releaseDatetxt
        voteAverage.text = voteAveragetxt

    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    


}
