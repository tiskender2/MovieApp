//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by tolga iskender on 19.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Networking.getMovieDetailData {
            self.setDatatoLabel()
            self.indicator.stopAnimating()
            self.FirbaseLogEvent()
        }
      
        
         
        
        
    }
    func setDatatoLabel(){
        for i in movieDetailArray {
        movieImage.sd_setImage(with: URL(string: i.image), placeholderImage: UIImage(named: ""))
        titleLabel.text = i.title
        directorLabel.text = "\(Utilities.director)"+i.director
        actorLabel.text =  "\(Utilities.Actors)"+i.actors
        imdbLabel.text =  "\(Utilities.imdb)"+"\(i.imdbRating)/\(i.imdbVotes)"
        releasedLabel.text =  "\(Utilities.movieyear)"+i.year
        }
    }
    
    func FirbaseLogEvent()
    {
        for i in movieDetailArray {
        Analytics.logEvent("Logs", parameters: ["title": i.title,"director":i.director,"actors":i.actors,"imdb":i.imdbRating,"released":i.year])
        }
    }
    
        

    

}
