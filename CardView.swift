//
//  CardView.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/6/25.
//

import SwiftUI

struct CardView: View {

    @State var card : Card
    
    var body: some View {
        Button {
            print(card.name)
        } label: {
            Image(card.image)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(8)
        }

    }
    
}

#Preview {
    CardView(card: Card(name: "Knight", elixir: 3, type: "troop", rarity: 0, image: "knight"))
}
