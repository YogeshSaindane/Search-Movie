//
//  MovieClass.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 29/01/21.
//

import Foundation

//class MovieCacheClass: NSObject{
//    static let shared = MovieCacheClass()
//    
//    private override init() {
//        
//    }
//    
//    var movieList : [MovieItem]?
//    
//}
@objc class MovieDetail:NSObject, Decodable {
    let  Title   : String?
    let  Year    : String?
    let  Rated   : String?
    let  Released: String?
    let  Runtime : String?
    let  Genre   : String?
    let  Director: String?
    let  Writer  : String?
    let  Actors  : String?
    let  Plot    : String?
    let  Language: String?
    let  Country : String?
    let  Awards  : String?
    let  Poster :String?
    let  Ratings    : [Rating]?
    let  Metascore   : String?
    let  imdbRating  : String?
    let  imdbVotes   : String?
    let  imdbID      : String?
    let  VideoType   : String?
    let  DVD         : String?
    let  BoxOffice   : String?
    let  Production  : String?
    let  Website     : String?
    let  Response    : String?
    
    private enum CodingKeys  : String,CodingKey{
        case Title
        case Year
        case Rated
        case Released
        case Runtime
        case Genre
        case Director
        case Writer
        case Actors
        case Plot
        case Language
        case Country
        case Awards
        case Poster
        case Ratings
        case Metascore
        case imdbRating
        case imdbVotes
        case imdbID
        case VideoType = "Type"
        case DVD
        case BoxOffice
        case Production
        case Website
        case Response
        
    }
    
}
class Rating : Codable{
    let Source : String?
    let Value : String?
    private enum CodingKeys  : String,CodingKey{
        case Source
        case Value
            
    }
}


class Movie : Decodable{
    
    var Search: [MovieItem]?
    private enum CodingKeys  : String,CodingKey{
        
        case Search
    }
    
}

@objc class MovieItem: NSObject, Decodable{
    var Title:String?
    var Year:String?
    var imdbID:String?
    var contentType:String?
    var Poster:String?
    
    
        init(movie_title:String, movie_Year:String, movie_imdbID:String, movie_contentType:String, movie_Poster:String){
            self.Title = movie_title
            self.Year = movie_Year
            self.imdbID = movie_imdbID
            self.contentType = movie_contentType
            self.Poster = movie_Poster
        }
    
    
    private enum CodingKeys  : String,CodingKey{
        case Title
        case Year
        case imdbID
        case contentType = "Type"
        case Poster
        
    }
}
