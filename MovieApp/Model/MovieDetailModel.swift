//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by tolga iskender on 19.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit

class MovieDetailModel {
    var image: String
    var title: String
    var year: String
    var actors: String
    var director: String
    var imdbRating: String
    var imdbVotes: String
    
    init( image: String, title:String, year:String, actors: String,director: String,imdbRating:String,imdbVotes:String) {
        
        self.image = image
        self.title = title
        self.year = year
        self.actors = actors
        self.director = director
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
    }
}
