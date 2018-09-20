//
//  MovieViewController.swift
//  MovieApp
//
//  Created by tolga iskender on 18.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UISearchBarDelegate,UISearchControllerDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sonucLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableviewCustomize()
      
    }
    override func viewDidAppear(_ animated: Bool) {
       
        Networking.getMovieData(basarili: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
            Utilities.movieTitle = searchText
            customMovie()
        
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.sonucLabel.text = ""
        defaultMovie()
        
    }
  
    
    
    func defaultMovie () {
        Utilities.movieTitle = "Batman"
        DispatchQueue.main.async {
            Networking.getMovieData(basarili: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
        
    }
    func customMovie()
    {
        DispatchQueue.main.async {
            self.indicator.startAnimating()
            Networking.getMovieData(basarili: {
                if Utilities.response == false {
                    self.sonucLabel.text = Utilities.emptyLabel
                    self.tableView.reloadData()
                    
                }
                else
                {
                    DispatchQueue.main.async {
                        self.sonucLabel.text = ""
                        self.tableView.reloadData()
                    }
                }
            })
            
        }
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController?.delegate = self
        navigationItem.searchController?.searchBar.delegate = self
    }
    func tableviewCustomize(){
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }


}
extension MovieViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Utilities.response == false {
            indicator.stopAnimating()
            return 0
        }
        else
        {
        return movieArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        if Utilities.response == true
        {
        cell.setDatastoTableview(image: movieArray[indexPath.row].image, title: movieArray[indexPath.row].title, year: movieArray[indexPath.row].year)
            indicator.stopAnimating()
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Utilities.movieId = movieArray[indexPath.row].imdbID
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    
}
