//
//  ViewController.swift
//  Food AR
//
//  Created by Deepesh Deshmukh on 21/09/19.
//  Copyright © 2019 Deepesh Deshmukh. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let hotels = ["Gurukripa Restaurant","Chaayos","NH3 Kitchen","Sharma Bhojnalaya","Wicked Witches","Jai\'s Kitchen","Chai Kaapi","Chai Sutta Bar","Johny Hot Dog","Faasos"]
    
    //var selctedRow : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath)
        
        cell.textLabel?.text = hotels[indexPath.row]
        
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //selctedRow = indexPath.row
        performSegue(withIdentifier: "goToMenu", sender: self)
    }
    
    
    // MARK: - Navigation
    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "goToMenu"{
//            let destinationVC = segue.destination as! MenuTableViewController
//
//            //destinationVC.incomingData = arr[selctedRow!]
//        }
//
    }

