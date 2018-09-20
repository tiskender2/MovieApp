//
//  MovieModel.swift
//  MovieApp
//
//  Created by tolga iskender on 18.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit

class MovieModel {
    var image: String
    var title: String
    var year: String
    var imdbID: String
    
    init( image: String, title:String, year:String, imdbID: String) {
        
        self.image = image
        self.title = title
        self.year = year
        self.imdbID = imdbID
    }
}
