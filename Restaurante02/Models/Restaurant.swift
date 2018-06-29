//
//  Restaurant.swift
//  Restaurante02
//
//  Created by CICE on 15/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import Foundation

class Restaurant {
    //Propierties
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    var phone = ""
    var rating = ""
    
    //Functions
        //Init
    init(name: String, type: String, location: String, image: String, isVisited: Bool, phone: String) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        self.phone = phone
    }
}
