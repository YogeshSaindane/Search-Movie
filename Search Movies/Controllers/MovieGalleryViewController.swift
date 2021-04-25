//
//  MovieGallryViewController.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 29/01/21.
//

import UIKit
import Alamofire
class MovieGalleryViewController: UIViewController {
    var movieID:String! = nil
    var currentMovie : MovieDetail?
    var selfViewModel : MovieViewModel?
    var contentArray = [String]()
    
    @IBOutlet var activtyIndicator: UIActivityIndicatorView!
    @IBOutlet var movieTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        registerCells()
        selfViewModel = MovieViewModel(movieprogressDelegate: self, movieListDelegate: self)
        selfViewModel?.getMovieDetails(movieID: movieID)
    }
    
    fileprivate func registerCells(){
        
        movieTableView.register(UINib(nibName: kCell.Movie_TableViewCell, bundle: nil) , forCellReuseIdentifier: kCellIdentifier.Movie_TableViewCell_Identifier)
        
        movieTableView.register(UINib(nibName: kCell.MovieCast_TableViewCell, bundle: nil) , forCellReuseIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier)
        
        movieTableView.register(UINib(nibName: kCell.MovieRating_TableViewCell, bundle: nil) , forCellReuseIdentifier: kCellIdentifier.MovieRating_TableViewCell_Identifier)
        
    }
    
    func getMovieContent(){
        if(currentMovie?.Poster != nil || currentMovie?.Title != nil){
            contentArray.append(Constant.movieHeader)
        }
        
        if(currentMovie?.Plot != nil){
            contentArray.append(Constant.movieDescription)
        }
        
        if(currentMovie?.Director != nil){
            contentArray.append(Constant.Director)
        }
        
        if(currentMovie?.Production != nil){
            contentArray.append(Constant.Production)
        }
        
        if(currentMovie?.Writer != nil){
            contentArray.append(Constant.Writer)
        }
        
        if(currentMovie?.Actors != nil){
            contentArray.append(Constant.Actors)
        }
        
        if(currentMovie?.Awards != nil){
            contentArray.append(Constant.Awards)
        }
        
        if(currentMovie?.BoxOffice != nil){
            contentArray.append(Constant.BoxOffice)
        }
        
        if(currentMovie?.Ratings != nil){
            contentArray.append(Constant.Ratings)
        }
    }
}


extension MovieGalleryViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch contentArray[indexPath.row] {
        case Constant.movieHeader:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.Movie_TableViewCell_Identifier, for: indexPath)as! Movie_TableViewCell
            
            cell.setCellFromDetails(movieItem: currentMovie!)
            
            return cell
            
            
        case Constant.movieDescription:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            
            cell.lbl_designation.text = Constant.Plot
            cell.lbl_person.text = currentMovie?.Plot
            
            return cell
            
        case Constant.Production:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            cell.lbl_designation.text = Constant.Production
            cell.lbl_person.text = currentMovie?.Production
            
            return cell
            
        case Constant.Director:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            cell.lbl_designation.text = Constant.Director
            cell.lbl_person.text = currentMovie?.Director
            return cell
        case Constant.Writer:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            cell.lbl_designation.text = Constant.Writer
            cell.lbl_person.text = currentMovie?.Writer
            
            return cell
        case Constant.Actors:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            cell.lbl_designation.text = Constant.Actors
            cell.lbl_person.text = currentMovie?.Actors
            
            return cell
        case Constant.Awards:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            cell.lbl_designation.text = Constant.Awards
            cell.lbl_person.text = currentMovie?.Awards
            
            return cell
        case Constant.BoxOffice:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieCast_TableViewCell_Identifier, for: indexPath)as! MovieCast_TableViewCell
            cell.lbl_designation.text = Constant.BoxOffice
            cell.lbl_person.text = currentMovie?.BoxOffice
            
            return cell
            
        case Constant.Ratings:
            
            let cell = movieTableView.dequeueReusableCell(withIdentifier: kCellIdentifier.MovieRating_TableViewCell_Identifier, for: indexPath)as! MovieRating_TableViewCell
            cell.setRatingView(rating: (currentMovie?.Ratings)!)
            
            return cell
            
            
        default:
            return UITableViewCell()
        }
        
    }
    
}


extension MovieGalleryViewController:MovieProgressDelegate{
    
    func showActivityIndicator() {
        self.activtyIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activtyIndicator.stopAnimating()
    }
    func showAlert(title: String, message: String) {
        self.popupAlert(title: title, message: message)
    }
    
}


extension MovieGalleryViewController:MovieDetailsTableDelegate{
    func reloadTableView(movieDetail: MovieDetail?) {
        currentMovie = movieDetail
        getMovieContent()
        self.movieTableView.reloadData()
        
    }
}
