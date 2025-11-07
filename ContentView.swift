import SwiftUI

struct ContentView: View {
    
    @State var cardSelection: [Card] = [
        Card(
            name: "Knight",
            elixir: 3,
            type: "troop",
            rarity: 0,
            image: "knight"
        ),
        Card(
            name: "Archers",
            elixir: 3,
            type: "troop",
            rarity: 0,
            image: "archers"
        ),
        Card(
            name: "Giant",
            elixir: 5,
            type: "troop",
            rarity: 1,
            image: "giant"
        ),
        Card(
            name: "Arrows",
            elixir: 3,
            type: "spell",
            rarity: 0,
            image: "arrows"
        ),
        Card(
            name: "Fireball",
            elixir: 4,
            type: "spell",
            rarity: 1,
            image: "fireball"
        ),
        Card(
            name: "Mini P.E.K.K.A",
            elixir: 4,
            type: "troop",
            rarity: 1,
            image: "minipekka"
        ),
        Card(
            name: "Minions",
            elixir: 3,
            type: "troop",
            rarity: 0,
            image: "minions"
        ),
        Card(
            name: "Musketeer",
            elixir: 4,
            type: "troop",
            rarity: 1,
            image: "musketeer"
        ),
        Card(
            name: "Baby Dragon",
            elixir: 4,
            type: "troop",
            rarity: 2,
            image: "babydragon"
        ),
        Card(
            name: "Bomber",
            elixir: 2,
            type: "troop",
            rarity: 0,
            image: "bomber"
        ),
        Card(
            name: "Cannon",
            elixir: 3,
            type: "building",
            rarity: 0,
            image: "cannon"
        ),
        Card(
            name: "Skeletons",
            elixir: 1,
            type: "troop",
            rarity: 0,
            image: "larry"
        ),
        Card(
            name: "Hog Rider",
            elixir: 4,
            type: "troop",
            rarity: 1,
            image: "hogrider"
        ),
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(0..<rowsCount, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<4) { columnIndex in
                            let index = rowIndex * 4 + columnIndex

                            if index < cardSelection.count {

                                let card = cardSelection[index]

                                VStack {
                                    CardView(card: card)

                                }
                                .frame(maxWidth: .infinity)
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
    private var rowsCount: Int {
        (cardSelection.count + 3) / 4
    }
}
