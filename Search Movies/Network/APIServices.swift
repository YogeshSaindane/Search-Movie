//
//  APIServices.swift
//  MovieGallary
//
//  Created by Encoding Solutions on 29/01/21.
//

import Foundation
import Alamofire
final class APIServices{
static let sharedObject = APIServices()
    
    func getMovieDetails(movieID:String,  onCompletion:@escaping(Result<MovieDetail?,Error>)->Void){
       
        let movieURLString = Constant.baseURL + Constant.movieID + movieID + "&apikey=" + Constant.apiKey
    
        getData(with: movieURLString) { (result) in
            switch result{
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(MovieDetail.self, from: data)
                    
                    onCompletion(.success(result))
                    
                }catch let err{
                    print(err.localizedDescription)
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
    func getMovieListData(name:String,  onCompletion:@escaping(Result<[MovieItem]?,Error>)->Void){
        let movieURLString = Constant.baseURL + Constant.movieSearch + name + "&apikey=" + Constant.apiKey
        
        getData(with: movieURLString) { (result) in
            switch result{
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Movie.self, from: data)
                  
                        onCompletion(.success(result.Search ?? nil))
                
                    
                }catch let err{
                    print(err.localizedDescription)
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
         
    }
    
    
    private func getData(with urlString:String, onCompletion : @escaping(Result<Data,Error>)->Void){
        let request =  AF.request(urlString)
         request.responseJSON { (response) in
                if(response.data != nil){
                    onCompletion(.success(response.data!))
                }else{
                    onCompletion(.failure(response.error!))
                }
         }
       
    }
}
