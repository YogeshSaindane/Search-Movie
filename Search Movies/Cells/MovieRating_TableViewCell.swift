//
//  MovieRating_TableViewCell.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 31/01/21.
//

import UIKit

class MovieRating_TableViewCell: UITableViewCell {

    @IBOutlet var lbl_rating: UILabel!
    @IBOutlet var lbl_rating1: UILabel!
    @IBOutlet var lbl_rating2: UILabel!
    @IBOutlet var lbl_rating3: UILabel!
    @IBOutlet var lbl_ratingValue1: UILabel!
    @IBOutlet var lbl_ratingValue2: UILabel!
    @IBOutlet var lbl_ratingValue3: UILabel!
    @IBOutlet var constraint_view1HT: NSLayoutConstraint!
    @IBOutlet var constraint_view2HT: NSLayoutConstraint!
    @IBOutlet var constraint_view3HT: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRatingView(rating: [Rating]){
        
        
        for temp in rating.enumerated(){
            let tempRating = temp.element
            switch temp.offset {
            case 0:
                
                lbl_rating1.text = tempRating.Source
                lbl_ratingValue1.text = tempRating.Value
                constraint_view2HT.constant = 0
                constraint_view3HT.constant = 0
                break
            case 1:
                lbl_rating2.text = tempRating.Source
                lbl_ratingValue2.text = tempRating.Value
                constraint_view2HT.constant = 31
                constraint_view3HT.constant = 0
                
                break
            case 2:
                lbl_rating3.text = tempRating.Source
                lbl_ratingValue3.text = tempRating.Value
                constraint_view2HT.constant = 31
                constraint_view3HT.constant = 31
                break
                
            default:
                break
            }
           
        }
          
    }
      
}
