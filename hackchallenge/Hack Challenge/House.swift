//
//  House.swift
//  Hack Challenge
//
//  Created by Library User on 11/21/19.
//  Copyright © 2019 Library User. All rights reserved.
//

import Foundation

class House {
    
    var address: String
    var numPeople: Int
    var priceMin: Int
    var priceMax: Int
    var features: [String]
    var coverImageURL: String
    var landlord: String
    //var bed: Int
    //var bath: Int
    
    init(address: String, numPeople: Int, priceMin: Int, priceMax: Int, features: [String], coverImageURL: String, landlord: String) {
        self.address = address
        self.numPeople = numPeople
        self.priceMin = priceMin
        self.priceMax = priceMax
        self.features = features
        self.coverImageURL = coverImageURL
        self.landlord = landlord
    }
    
    
}
