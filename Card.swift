//
//  Card.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/5/25.
//

import Foundation

class Card: Identifiable, Hashable {
    let id = UUID()
    var name : String
    var elixir : Int
    var type : String
    var rarity : Int
    var role : String
    var image : String
    
    init(name: String, elixir: Int, type: String, rarity: Int, role: String, image: String) {
        self.name = name
        self.elixir = elixir
        self.type = type
        self.rarity = rarity
        self.role = role
        self.image = image
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
            lhs.name == rhs.name
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
}


