//
//  MovieCast_TableViewCell.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 31/01/21.
//

import UIKit

class MovieCast_TableViewCell: UITableViewCell {

    @IBOutlet var lbl_designation: UILabel!
    @IBOutlet var lbl_person: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
