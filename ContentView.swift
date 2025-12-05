import SwiftUI

struct ContentView: View {

    @State var cardSelection: [Card] = [
        Card(
            name: "Knight",
            elixir: 3,
            type: "troop",
            rarity: 0,
            role: "mini tank",
            image: "knight"
        ),
        Card(
            name: "Archers",
            elixir: 3,
            type: "troop",
            rarity: 0,
            role: "air defense",
            image: "archers"
        ),
        Card(
            name: "Giant",
            elixir: 5,
            type: "troop",
            rarity: 1,
            role: "win condition",
            image: "giant"
        ),
        Card(
            name: "Arrows",
            elixir: 3,
            type: "spell",
            rarity: 0,
            role: "splash",
            image: "arrows"
        ),
        Card(
            name: "Fireball",
            elixir: 4,
            type: "spell",
            rarity: 1,
            role: "splash",
            image: "fireball"
        ),
        Card(
            name: "Mini P.E.K.K.A",
            elixir: 4,
            type: "troop",
            rarity: 1,
            role: "dps",
            image: "minipekka"
        ),
        Card(
            name: "Minions",
            elixir: 3,
            type: "troop",
            rarity: 0,
            role: "air defense",
            image: "minions"
        ),
        Card(
            name: "Musketeer",
            elixir: 4,
            type: "troop",
            rarity: 1,
            role: "air defense",
            image: "musketeer"
        ),
        Card(
            name: "Baby Dragon",
            elixir: 4,
            type: "troop",
            rarity: 2,
            role: "splash",
            image: "babydragon"
        ),
        Card(
            name: "Bomber",
            elixir: 2,
            type: "troop",
            rarity: 0,
            role: "splash",
            image: "bomber"
        ),
        Card(
            name: "Cannon",
            elixir: 3,
            type: "building",
            rarity: 0,
            role: "building",
            image: "cannon"
        ),
        Card(
            name: "Skeletons",
            elixir: 1,
            type: "troop",
            rarity: 0,
            role: "cycle",
            image: "larry"
        ),
        Card(
            name: "Hog Rider",
            elixir: 4,
            type: "troop",
            rarity: 1,
            role: "win condition",
            image: "hogrider"
        ),
    ]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    @StateObject var myDeck: Deck = Deck()

    var body: some View {
        VStack {
            Text("Click cards to add them to your deck")
                .font(.caption2)

            
            DeckView(deck: myDeck)

            NavigationStack {
                HStack(spacing: 20) {

                    NavigationLink(
                        destination: AnalysisView(deck: myDeck),
                        label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(myDeck.cards.count == 8 ? Color.yellow : Color.gray.opacity(0.6))
                                    .frame(width: 130, height: 50)
                                Text("Submit")
                                    .font(.title)
                                    .foregroundStyle(.white)
                            }
                        }
                    )
                    .disabled(myDeck.cards.count != 8)
                    .simultaneousGesture(TapGesture().onEnded {
                        if myDeck.cards.count == 8 {
                            DeckHistory.shared.addDeck(Deck(copy: myDeck))
                        }
                    })

                    NavigationLink(destination: HistoryView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color.orange)
                                .frame(width: 160, height: 50)
                            Text("See History")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                    }
                }

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(cardSelection.filter { card in
                            !myDeck.cards.contains(where: { $0.id == card.id })
                        }, id: \.id) { card in
                            CardView(card: card, deck: myDeck)
                                .frame(height: 100)
                                .transition(.opacity)
                                
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


