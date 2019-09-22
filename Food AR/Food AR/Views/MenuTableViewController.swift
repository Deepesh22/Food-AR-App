//
//  MenuTableViewController.swift
//  Food AR
//
//  Created by Deepesh Deshmukh on 21/09/19.
//  Copyright © 2019 Deepesh Deshmukh. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    
    var allitems = ItemsBank().list
    
    var item : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let r = Int(arc4random_uniform(6) + 1)
        
        allitems = Array(allitems.shuffled()[...r])
        
        }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allitems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu", for: indexPath)
        
        cell.textLabel?.text = allitems[indexPath.row].name
        

        return cell
    }
   

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        item = allitems[indexPath.row]
        print(indexPath.row)

        performSegue(withIdentifier: "goToAR", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAR"{
            let destinationVC = segue.destination as! ARViewController

            destinationVC.path = item?.path
            destinationVC.details = item?.detail
            destinationVC.nodename = item?.nodename
        }
    }
    
}
