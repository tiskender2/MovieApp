//
//  ViewController.swift
//  MovieApp
//
//  Created by tolga iskender on 18.09.2018.
//  Copyright © 2018 tolga iskender. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var loodosLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        setupNavBar()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
            checkConnection()
    }
   
    func Alert (Message: String){
     
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func RemoteConfigs(){
        let labelText = RemoteConfig.remoteConfig().configValue(forKey: "labelText").stringValue
        loodosLabel.text = labelText
    }
    
    @objc func passViewController(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func setupNavBar()
    {
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func checkConnection()
    {
        if CheckInternet.Connection() == true {
            stackView.layoutIfNeeded()
            self.loodosLabel.layoutIfNeeded()
            self.loodosLabel.font = UIFont(name: "System-Semibold", size: 35)
            self.loodosLabel.font = loodosLabel.font.withSize(35)
            RemoteConfigs()
                self.stackView.arrangedSubviews[1].isHidden = true
            perform(#selector(passViewController), with:nil, afterDelay: 3)
            
            
            
        }
        else{
            DispatchQueue.main.async {
                self.stackView.layoutIfNeeded()
                UIView.animate(withDuration: 0.3){
                    self.stackView.arrangedSubviews[1].isHidden = false
                }
                self.Alert(Message: "Your Device is not connected to Internet")
                self.loodosLabel.text = "Your Device is not connected to Internet"
                self.loodosLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
            }
            
            
        }
    }
    
    @IBAction func checkConnection_Button(_ sender: Any) {
        checkConnection()
    }
    
}


