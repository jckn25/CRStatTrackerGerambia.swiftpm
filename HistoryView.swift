//
//  HistoryView.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/19/25.
//

/*import SwiftUI

struct HistoryView: View {

    // Grab all saved decks
    @ObservedObject var history = DeckHistory.shared

    var body: some View {
        NavigationStack {
            List {
                ForEach(history.decks.indices, id: \.self) { index in
                    
                    VStack(spacing: 8) {
                        
                        let deckBinding = $history.decks[index]
                        let ratings = rateDeck(deck: deckBinding.wrappedValue)
                        
                        DeckView(deck: deckBinding)
                            .frame(height: 200)
                            .scaleEffect(0.9)
                        
                        Text("Overall Rating: \(ratings.overall)/10")
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.15))
                            .padding(.vertical, 6)
                    )
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Deck History")
        }
    }

    func deleteItems(at offsets: IndexSet) {
        history.remove(atOffsets: offsets)
    }

    func rateDeck(deck: Deck) -> (
        attack: Int, defense: Int, synergy: Int, versatility: Int, overall: Int
    ) {
        var attack = 0
        var defense = 0
        var synergy = 0
        var versatility = 0

        let roles = deck.cards.map { $0.role }

        attack = roles.filter { $0 == "win condition" || $0 == "dps" }.count * 2
        attack = min(attack, 10)

        defense =
            roles.filter {
                $0 == "air defense" || $0 == "splash" || $0 == "building"
            }.count * 2
        defense = min(defense, 10)

        let requiredRoles = [
            "win condition", "mini tank", "dps", "air defense", "splash",
        ]
        let matchedRoles = requiredRoles.filter { roles.contains($0) }.count
        synergy = Int(Double(matchedRoles) / Double(requiredRoles.count) * 10)

        let types = Set(deck.cards.map { $0.type })
        let groundAir = Set(
            deck.cards.map { $0.role.contains("air") ? "air" : "ground" }
        )
        versatility = min((types.count + groundAir.count) * 2, 10)

        let overall = Int(
            Double(attack + defense + synergy + versatility) / 4.0
        )

        return (attack, defense, synergy, versatility, overall)
    }

}*/

import SwiftUI

struct HistoryView: View {
    @ObservedObject var history = DeckHistory.shared

    var body: some View {
        NavigationStack {            
            List {
                ForEach(history.decks.indices, id: \.self) { index in
                    DeckRow(deck: $history.decks[index])
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Deck History")
        }
    }

    func deleteItems(at offsets: IndexSet) {
        history.remove(atOffsets: offsets)
    }
}

// A separate view to represent a row in the history list
struct DeckRow: View {
    @Binding var deck: Deck

    var body: some View {
        let ratings = HistoryView.rateDeck(deck: deck)
        
        VStack(spacing: 8) {
            DeckView(deck: deck)
                .frame(height: 200)
                .scaleEffect(0.9)
            
            Text("Overall Rating: \(ratings.overall)/10")
                .font(.subheadline)
                .foregroundStyle(.black)
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.15))
                .padding(.vertical, 6)
        )
    }
}

extension HistoryView {
    static func rateDeck(deck: Deck) -> (
        attack: Int, defense: Int, synergy: Int, versatility: Int, overall: Int
    ) {
        var attack = 0
        var defense = 0
        var synergy = 0
        var versatility = 0

        let roles = deck.cards.map { $0.role }

        attack = roles.filter { $0 == "win condition" || $0 == "dps" }.count * 2
        attack = min(attack, 10)

        defense =
            roles.filter { $0 == "air defense" || $0 == "splash" || $0 == "building" }.count * 2
        defense = min(defense, 10)

        let requiredRoles = ["win condition", "mini tank", "dps", "air defense", "splash"]
        let matchedRoles = requiredRoles.filter { roles.contains($0) }.count
        synergy = Int(Double(matchedRoles) / Double(requiredRoles.count) * 10)

        let types = Set(deck.cards.map { $0.type })
        let groundAir = Set(deck.cards.map { $0.role.contains("air") ? "air" : "ground" })
        versatility = min((types.count + groundAir.count) * 2, 10)

        let overall = Int(Double(attack + defense + synergy + versatility) / 4.0)

        return (attack, defense, synergy, versatility, overall)
    }
}

