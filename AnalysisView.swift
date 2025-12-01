//
//  AnalysisView.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/17/25.
//

import SwiftUI

struct AnalysisView: View {
    @ObservedObject var deck: Deck

    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .font(.title3)
            Text(analyzeDeck(deck: deck))
            let ratings = rateDeck(deck: deck)

            VStack(spacing: 12) {
                Text("Deck Analysis")
                    .font(.title2)
                    .bold()

                VStack(alignment: .leading, spacing: 6) {
                    Text("Attack: \(ratings.attack)/10")
                    Text("Defense: \(ratings.defense)/10")
                    Text("Synergy: \(ratings.synergy)/10")
                    Text("Versatility: \(ratings.versatility)/10")
                    Divider()
                    Text("Overall Rating: \(ratings.overall)/10")
                        .font(.headline)
                        .bold()
                }
                .padding()

                Spacer()
            }
            .padding()
            .navigationTitle("Analysis")
        }
    }

    func analyzeDeck(deck: Deck) -> String {
        var checklist = [
            "win condition", "splash", "air defense", "dps", "mini tank",
        ]
        for card in deck.cards {
            for item in checklist {
                if card.role == item {
                    checklist.removeAll { $0 == card.role }
                }
            }
        }

        if checklist.isEmpty {
            return "Your deck is good!"
        } else {
            return "Your deck needs improvements..."
        }
    }

    func rateDeck(deck: Deck) -> (
        attack: Int, defense: Int, synergy: Int, versatility: Int, overall: Int
    ) {

        // Subratings start at 0
        var attack = 0
        var defense = 0
        var synergy = 0
        var versatility = 0

        let roles = deck.cards.map { $0.role }

        // Attack: count win condition / high-damage cards
        attack = roles.filter { $0 == "win condition" || $0 == "dps" }.count * 2
        attack = min(attack, 10)

        // Defense: count splash / air defense / buildings
        defense =
            roles.filter {
                $0 == "air defense" || $0 == "splash" || $0 == "building"
            }.count * 2
        defense = min(defense, 10)

        // Synergy: balance of roles
        let requiredRoles = [
            "win condition", "mini tank", "dps", "air defense", "splash",
        ]
        let matchedRoles = requiredRoles.filter { roles.contains($0) }.count
        synergy = Int(Double(matchedRoles) / Double(requiredRoles.count) * 10)

        // Versatility: mix of spell/troop/building & air/ground
        let types = Set(deck.cards.map { $0.type })
        let groundAir = Set(
            deck.cards.map { $0.role.contains("air") ? "air" : "ground" }
        )
        versatility = min((types.count + groundAir.count) * 2, 10)

        // Overall rating: average
        let overall = Int(
            Double(attack + defense + synergy + versatility) / 4.0
        )

        return (attack, defense, synergy, versatility, overall)
    }

}
