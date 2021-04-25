//
//  MovieListVM.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 25/04/21.
//

import Foundation




class MovieListViewModel: NSObject {
    
    var delegate : MovieProgressDelegate?
    var delegateT: MovieListTableDelegate?
    init(movieprogressDelegate:MovieProgressDelegate, movieListDelegate:MovieListTableDelegate){
        super.init()
        delegate = movieprogressDelegate
        delegateT = movieListDelegate
    }
    func getMovieList(movieName: String) {

        delegate?.showActivityIndicator?()
        APIServices.sharedObject.getMovieListData(name: movieName) { [self] (result) in
            
            switch result{
            case .success(let movieList):
                DispatchQueue.main.async {
                    if(movieList == nil){
                        delegate?.showAlert?(title: "", message: "Result not found")
                    }
                    delegate?.hideActivityIndicator?()
                    delegateT?.reloadTableView?(movieList: movieList)
                }
            break
            case .failure( _):
                DispatchQueue.main.async {
                    delegate?.hideActivityIndicator?()
                    delegateT?.reloadTableView?(movieList: nil)
                    delegate?.showAlert?(title: "", message: "Result not found")
                }
            break
            
            }
        }

    }
    
    
    
    
    
    
    
    
}
