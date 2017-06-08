//
//  Fruit.swift
//  FreshCrate
//
//  Created by Dishank Jhaveri on 10/05/17.
//  Copyright © 2017 Dishank Jhaveri. All rights reserved.
//

import Foundation

class Fruit: NSObject{
    
    var fruitName = ""
    
    var title : String? {
        get {
            return fruitName
        }
    }
    
    override var description : String {
        return "{\n\t Fruit Name: \(fruitName)\n}"
    }
    
    init(fruitName:String) {
        self.fruitName = fruitName
    }
    
    
}


