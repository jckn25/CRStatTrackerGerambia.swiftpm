//
//  Card.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/5/25.
//

import Foundation

class Card: Identifiable {
    let id = UUID()
    var name : String
    var elixir : Int
    var type : String
    var rarity : Int
    var image : String
    
    init(name: String, elixir: Int, type: String, rarity: Int, image: String) {
        self.name = name
        self.elixir = elixir
        self.type = type
        self.rarity = rarity
        self.image = image
    }
}


