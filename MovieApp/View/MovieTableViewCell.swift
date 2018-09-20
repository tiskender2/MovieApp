//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by tolga iskender on 18.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit
import SDWebImage
class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var movieView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customizeView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setDatastoTableview(image:String,title:String,year:String)
    {
        self.movieTitle.text = title
        self.movieYear.text = "\(Utilities.movieyear)"+year
        self.movieView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""))
    }
    func customizeView()
    {
        customView.layer.cornerRadius = 10
        customView.layer.bounds = CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5)
        customView.layer.shadowOpacity = 0.3
        customView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.selectionStyle = .none
     
    }

}
