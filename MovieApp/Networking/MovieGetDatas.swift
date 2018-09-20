//
//  MovieGetDatas.swift
//  MovieApp
//
//  Created by tolga iskender on 18.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var movieArray : [MovieModel] = []
var movieDetailArray : [MovieDetailModel] = []

class Networking {
    
    static func getMovieData (basarili: @escaping () -> Void) {
        
        movieArray.removeAll()
        let url =  "\(Utilities.urlString)?apikey=\(Utilities.apiKey)&s=\(Utilities.movieTitle)"
        Alamofire.request(url, method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let movies = json["Search"]
                let response = json["Response"]
                if response == "True"
                {
                Utilities.response = true
                movies.array?.forEach({ (result) in
                
                    let Datas = MovieModel(image: result["Poster"].stringValue, title: result["Title"].stringValue, year: result["Year"].stringValue, imdbID: result["imdbID"].stringValue)
                    movieArray.append(Datas)
                  
                })
                   
                }
                else
                {
                    Utilities.response = false
                }
                basarili()
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
    }
    
    
    static func getMovieDetailData (basarili: @escaping () -> Void) {
        
        movieArray.removeAll()
        let url =  "\(Utilities.urlString)?i=\(Utilities.movieId)&apikey=\(Utilities.apiKey)"
        Alamofire.request(url, method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let Data = MovieDetailModel(image: json["Poster"].stringValue, title: json["Title"].stringValue, year: json["Year"].stringValue, actors: json["Actors"].stringValue, director: json["Director"].stringValue, imdbRating: json["imdbRating"].stringValue, imdbVotes: json["imdbVotes"].stringValue)
                movieDetailArray.append(Data)
                
                basarili()
            case .failure(let error):
                print(error)
            }
        }
        
        
        
        
    }
    
}
