//
//  Constant.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 29/01/21.
//

import Foundation
struct Constant {
    static let baseURL = "http://www.omdbapi.com/?"
    static let movieSearch = "s="
    static let movieID = "i="
    static let apiKey = "c0b7c24c"
    static let urlInvalid = "Invalid url"
    static let somethingWentWrong = "No movie found with this name"
    static let movieHeader = "movieHeader"
    static let movieDescription = "movieDescription"
    static let movieReview = "movieReview"

    static let  Title       = "Title"
    static let  Year        = "Year"
    static let  Rated       = "Rated"
    static let  Released    = "Released"
    static let  Runtime     = "Runtime"
    static let  Genre       = "Genre"
    static let  Director    = "Director"
    static let  Writer      = "Writer"
    static let  Actors      = "Actors"
    static let  Plot        = "Description"
    static let  Language    = "Language"
    static let  Country     = "Country"
    static let  Awards      = "Awards"
    static let  Poster      = "Poster"
    static let  Ratings     = "Ratings"
    static let  Metascore   = "Metascore"
    static let  imdbRating  = "imdbRating"
    static let  imdbVotes   = "imdbVotes"
    static let  imdbID      = "imdbID"
    static let  VideoType   = "VideoType"
    static let  DVD         = "DVD"
    static let  BoxOffice   = "BoxOffice"
    static let  Production  = "Production"
    static let  Website     = "Website"
    static let  Response    = "Response"
    
    
    
}

struct kCell{
    static let Movie_TableViewCell  = "Movie_TableViewCell"
    static let MoviePoster_TableViewCell = "MoviePoster_TableViewCell"
    static let MovieCast_TableViewCell = "MovieCast_TableViewCell"
    static let MovieRating_TableViewCell = "MovieRating_TableViewCell"
     
}
struct kCellIdentifier {
    static let Movie_TableViewCell_Identifier  = "Movie_TableViewCellIdentifierIdentifier"
    static let MoviePoster_TableViewCell_Identifier = "MoviePoster_TableViewCellIdentifier"
    static let MovieCast_TableViewCell_Identifier = "MovieCast_TableViewCellIdentifier"
    static let MovieRating_TableViewCell_Identifier = "MovieRating_TableViewCellIdentifier"
}

struct kStoryboard {
    static let MovieGallery = "MovieGallery"
    static let MovieGalleryViewController_Identifier = "MovieGalleryViewControllerIdentifier"
}

struct kStoryboardIdentifier {
    static let MovieGalleryIdentifier = "MovieGallery"
    static let MovieGalleryViewController_Identifier = "MovieGalleryViewController"
}
