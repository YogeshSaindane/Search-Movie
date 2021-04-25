//
//  MovieList_ViewController.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 31/01/21.
//

import UIKit
import Alamofire
class MovieList_ViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var movieSearchBar: UISearchBar!
    @IBOutlet var movieListTable: UITableView!
    var movieList : [MovieItem]?
    var selfViewModel : MovieListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        selfViewModel = MovieListViewModel(movieprogressDelegate: self, movieListDelegate: self)
        self.title = "Movies"
        movieSearchBar.delegate = self
    }
    
    func registerCell(){
        movieListTable.register(UINib(nibName: kCell.Movie_TableViewCell, bundle: nil) , forCellReuseIdentifier: kCellIdentifier.Movie_TableViewCell_Identifier)
    }
    
}

extension MovieList_ViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movieSearchBar.showsCancelButton = false
        movieSearchBar.text = nil
        movieList = nil
        self.movieListTable.reloadData()
        self.activityIndicator.stopAnimating()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text != nil && searchBar.text != ""){
            selfViewModel?.getMovieList(movieName: searchBar.text!.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)
        }
        movieSearchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        movieSearchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        movieSearchBar.showsCancelButton = false
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieSearchBar.showsCancelButton = true
    }
    
    
}



extension MovieList_ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieListTable.dequeueReusableCell(withIdentifier: kCellIdentifier.Movie_TableViewCell_Identifier, for: indexPath) as! Movie_TableViewCell
        let tempMovie = movieList![indexPath.row]
        cell.setCell(movieItem: tempMovie)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieListTable.deselectRow(at: indexPath, animated: true)
        movieSearchBar.resignFirstResponder()
        let tempMovie = movieList![indexPath.row]
       
        guard (tempMovie.imdbID != nil) else {
            return
        }
       
        let storyboard = UIStoryboard(name: kStoryboard.MovieGallery, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: kStoryboard.MovieGalleryViewController_Identifier) as! MovieGalleryViewController
        vc.movieID = tempMovie.imdbID
        vc.title = tempMovie.Title
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}



extension MovieList_ViewController:MovieProgressDelegate{
    
    
    func showActivityIndicator() {
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
    }
    
    func showAlert(title: String, message: String) {
        self.popupAlert(title: title, message: message)
    }
    
}

extension MovieList_ViewController:MovieListTableDelegate{
    func reloadTableView(movieList: [MovieItem]?) {
        self.movieList = movieList
    
        DispatchQueue.main.async {
            self.movieListTable.reloadData()
        }
        
        
    }
}
