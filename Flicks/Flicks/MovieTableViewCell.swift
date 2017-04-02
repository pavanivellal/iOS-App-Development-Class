//
//  MovieTableViewCell.swift
//  Flicks
//
//  Created by Sheshagiri Haniyur on 3/31/17.
//  Copyright © 2017 Pavani Vellal. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDesc: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
