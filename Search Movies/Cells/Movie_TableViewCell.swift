//
//  Movie_TableViewCell.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 31/01/21.
//

import UIKit
import Alamofire
import SDWebImage

class Movie_TableViewCell: UITableViewCell {

    @IBOutlet var movieContainerView: UIView!
    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var lbl_movieTitle: UILabel!
    @IBOutlet var lbl_movieDetails: UILabel!
    
    @IBOutlet var ratingView: UIView!
    @IBOutlet var lbl_rating: UILabel!
//    var movieImage = UIImage(){
//        didSet{
//            DispatchQueue.main.async { [self] in
//                moviePoster.image = movieImage
//                self.layoutSubviews()
//            }
//
//        }
//    }
    var movieName : String?
    var movieDetail : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.moviePoster.layer.cornerRadius = 5
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(movieItem: MovieItem){
        self.movieContainerView.layer.borderWidth = 1
        self.movieContainerView.layer.borderColor = UIColor.lightGray.cgColor
        self.movieContainerView.layer.cornerRadius = 5
        
        self.moviePoster.getImage(from: movieItem.Poster)
        
        if (movieItem.Title != nil) {
            movieName = movieItem.Title!
        }
        
        if(movieName != nil && movieItem.Year != nil ){
            self.lbl_movieTitle.text = movieName! + "(\(movieItem.Year!))"
        }
    }
    
    
    
    func setCellFromDetails(movieItem: MovieDetail){
        
        self.moviePoster.getImage(from: movieItem.Poster)
        self.moviePoster.contentMode = .scaleToFill
        if (movieItem.Title != nil) {
            movieName = movieItem.Title!
        }
        
        if(movieName != nil && movieItem.Year != nil ){
            self.lbl_movieTitle.text = movieName! + "(\(movieItem.Year!))"
        }
        
        
        if (movieItem.Runtime != nil){
            movieDetail = movieItem.Runtime
        }
        
        if(movieDetail != nil){
            if(movieItem.Language != nil){
                movieDetail = movieDetail! + " | \(movieItem.Language!)"
            }
        }else{
            if(movieItem.Language != nil){
                movieDetail = "\(movieItem.Language!)"
            }
        }
        
        
        if(movieDetail != nil){
            if(movieItem.Genre != nil){
                movieDetail = movieDetail! + " | \(movieItem.Genre!)"
            }
        }else{
            if(movieItem.Genre != nil){
                movieDetail = "\(movieItem.Genre!)"
            }
        }
        
        lbl_movieDetails.text = movieDetail
        
        if(movieItem.imdbRating != nil){
            ratingView.layer.cornerRadius = 10.0
            ratingView.isHidden = false
            ratingView.backgroundColor = UIColor(hexString: "#f54949")
            lbl_rating.text = movieItem.imdbRating! + " IMDb"
            lbl_rating.textColor = .white
        }
        
          
    }
    
    
    
    
    
}
