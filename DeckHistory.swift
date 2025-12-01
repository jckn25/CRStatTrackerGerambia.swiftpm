//
//  DeckHistory.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/19/25.
//

import Foundation

@MainActor
class DeckHistory: ObservableObject, Identifiable {
    static let shared = DeckHistory()
    
    @Published var decks: [Deck] = []
    
    private init() {}
    
    func addDeck(_ deck: Deck) {
        decks.append(deck)
    }
    
    func remove(atOffsets offsets: IndexSet) {
            decks.remove(atOffsets: offsets)
    }
}
