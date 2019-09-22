//
//  ItemBank.swift
//  Quizzler
//
//  Created by Angela Yu on 26/08/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import Foundation

class ItemsBank {
    
    var list = [Item]()
    
    init() {
        
        // Creating a quiz item and appending it to the list
        let item = Item(setname: "Orange", setdetail: "50 cal / 100gm\n")
        
        // Add the Item to the list of Items
        list.append(item)
        
        list.append(Item(setname: "Icecream", setdetail: "215 cal / 100gm\n Warning: Contains Milk,\n Additive sugar, nuts"))
        
        list.append(Item(setname: "Turkey", setdetail: "160 cal / 100gm\n Warning: Not good for people with\n Meat/ Milk allergy"))
        
        list.append(Item(setname: "coke", setdetail: "144 cal / serving(300ml)\n Warning: Contains Caffeine"))
        
        list.append(Item(setname: "Bread", setdetail: "350 cal / 100gm\nWarning: Contain Gluten,\n butter, cream"))
        
        list.append(Item(setname: "Birthday Cake", setdetail: "289 calories / 100gm\nAllergy Warning: Contains Egg,\n Peanuts, Gluten Milk"))
        
        list.append(Item(setname: "Pepperoni", setdetail: "313 cal / slice(110gm)\n Warning: Contain Gluten\n and other allergens"))
        
        list.append(Item(setname: "Sandwich", setdetail: "350 cal / 100gm\nWarning: Contain Wheat Gluten\n and other allergens"))
        
        list.append(Item(setname: "Pot Of Shrimp Gumbo", setdetail: "320 - 450 cal / cup\n Warning: Contain sea\n food in high concetration"))
        
        list.append(Item(setname: "shrimp", setdetail: "210 cal / cup\n Warning: Contain sea\n food in high concetration"))

        
       // list.append(Item(setname: "Donut", setdetail: String(r(150) + r(100) + r(23)) + "calories"))
        
    }
    
}


