//
//  MovieCell.swift
//  CoppornIOS
//
//  Created by Vader1359 on 6/19/17.
//  Copyright © 2017 vader1359. All rights reserved.
//

import UIKit

class MovieCellLeft: UITableViewCell {
    // List of outlets
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
