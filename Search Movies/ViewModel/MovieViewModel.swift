//
//  MovieViewModel.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 25/04/21.
//

import Foundation
class MovieViewModel: NSObject {
    var delegate : MovieProgressDelegate?
    var delegateT : MovieDetailsTableDelegate?
    
    init(movieprogressDelegate:MovieProgressDelegate, movieListDelegate:MovieDetailsTableDelegate){
        super.init()
        delegate = movieprogressDelegate
        delegateT = movieListDelegate
    }
    
    func getMovieDetails(movieID: String){
        APIServices.sharedObject.getMovieDetails(movieID: movieID) { (result) in
            switch result{
            case .success(let movieObject):
                DispatchQueue.main.async { [self] in
                    if(movieObject == nil){
                        delegate?.showAlert?(title: "", message: "Result not found")
                    }
                    delegate?.hideActivityIndicator?()
                    delegateT?.reloadTableView?(movieDetail: movieObject)
                }
            break
            case .failure( _):
                DispatchQueue.main.async { [self] in
                    delegate?.hideActivityIndicator?()
                    delegateT?.reloadTableView?(movieDetail: nil)
                    delegate?.showAlert?(title: "", message: "Result not found")
                }
            break
            
            }
            
        }
    }
    
    

    
}

