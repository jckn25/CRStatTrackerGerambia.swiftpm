//
//  CardView.swift
//  CRStatTrackerGerambia
//
//  Created by JACKSON GERAMBIA on 11/6/25.
//

import SwiftUI

struct CardView: View {

    var card: Card
    @ObservedObject var deck: Deck
    var allowRemove: Bool = false

    @State private var isClicked = false
    @State private var deckFull = false

    var body: some View {
        VStack(spacing: 4) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isClicked.toggle()
                }
            } label: {
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(8)
                    .shadow(radius: 1)
            }

            if isClicked {
                VStack(spacing: 8) {
                    Button {

                        if allowRemove {
                            if let index = deck.cards.firstIndex(where: {
                                $0.id == card.id
                            }) {
                                deck.cards.remove(at: index)
                            }
                        } else {
                            if !deck.cards.contains(where: { $0.id == card.id })
                                && deck.cards.count < 8
                            {
                                deck.cards.append(card)
                            } else if deck.cards.count >= 8 {
                                deckFull = true
                            }
                        }

                        isClicked = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(
                                    allowRemove ? Color.red : Color.green
                                )
                                .frame(width: 60, height: 30)
                            Text(allowRemove ? "Remove" : "Add")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }
                    .alert("Deck is Full", isPresented: $deckFull) {
                        Button("OK", role: .cancel) {}
                    }
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}
