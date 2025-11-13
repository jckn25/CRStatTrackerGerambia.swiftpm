//
//  Deck.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/5/25.
//

import Foundation

class Deck: ObservableObject {
    @Published var cards : [Card]
    
    var averageElixir: Double {
            guard !cards.isEmpty else { return 0 }
            let total = cards.reduce(0) { $0 + Double($1.elixir) }
            return total / Double(cards.count)
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    init() {
        self.cards = []
    }
    
}


