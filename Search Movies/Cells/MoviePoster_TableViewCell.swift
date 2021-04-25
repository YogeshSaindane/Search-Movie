//
//  MoviePoster_TableViewCell.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 30/01/21.
//

import UIKit

class MoviePoster_TableViewCell: UITableViewCell {

    @IBOutlet var movie_Poster: UIImageView!
    @IBOutlet var lbl_movieDescription: UILabel!
    @IBOutlet var lbl_MovieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
