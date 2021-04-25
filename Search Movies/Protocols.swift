//
//  Protocols.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 25/04/21.
//

import Foundation
@objc protocol MovieProgressDelegate {
    @objc optional func showActivityIndicator()
    @objc optional func hideActivityIndicator()
    @objc optional func showAlert(title:String ,message:String)
 
}

@objc protocol MovieListTableDelegate {
    @objc optional func reloadTableView(movieList: [MovieItem]?)
}
@objc protocol MovieDetailsTableDelegate {
    @objc optional func reloadTableView(movieDetail: MovieDetail?)
}

