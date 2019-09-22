//
//  Question.swift
//  Quizzler
//
//  Created by Angela Yu on 26/08/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import Foundation

class Item {
    
    let name : String
    let path : String
    let detail : String
    let nodename: String
    
    init(setname : String, setdetail : String) {
        name = setname
        detail = setdetail
        let joined = setname.replacingOccurrences(of: " ", with: "")
        path = "art.scnassets/" + joined + "/" + joined + ".scn"
        nodename = joined
        //print(joined)
    }
    
}

