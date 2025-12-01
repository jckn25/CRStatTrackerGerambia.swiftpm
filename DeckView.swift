//
//  DeckView.swift
//  CRStatTrackerGerambiaNew
//
//  Created by JACKSON GERAMBIA on 11/10/25.
//

import SwiftUI

struct DeckView: View {

    @ObservedObject var deck: Deck

    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 4)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 420, height: 250)
                .foregroundStyle(.gray.opacity(0.3))

            VStack(spacing: 8) {

                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(deck.cards, id: \.id) { card in
                        CardView(card: card, deck: deck, allowRemove: true)
                            .frame(width: 70, height: 80)
                    }
                }

                HStack {
                    Image("elixir")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 20)
                    Text(String(format: "%.1f", deck.averageElixir))
                        .font(.title)
                    Spacer()
                }
                .padding(.top, 8)
            }
            .padding(.vertical)
        }
    }
}




