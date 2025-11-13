//
//  DeckView.swift
//  CRStatTrackerGerambiaNew
//
//  Created by JACKSON GERAMBIA on 11/10/25.
//

import SwiftUI

struct DeckView: View {

    @Binding var deck: Deck

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 420, height: 250)
                .foregroundStyle(.gray.opacity(0.3))

            VStack(spacing: 8) {
                // Two rows of four cards/slots
                ForEach(0..<2) { row in
                    HStack(spacing: 8) {
                        ForEach(0..<4) { col in
                            let index = row * 4 + col
                            if index < deck.cards.count {
                                // Display actual card
                                Image(deck.cards[index].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 80)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                            } else {
                                // Placeholder slot for empty cards
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 70, height: 80)
                                    .foregroundStyle(.gray.opacity(0.6))
                            }
                        }
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

        
        
        /*ZStack {

            RoundedRectangle(cornerRadius: 20)
                .frame(width: 420, height: 250)
                .foregroundStyle(.gray)
                .opacity(0.3)
            VStack {
                
                ForEach(0..<2) { row in
                    HStack {
                        ForEach(0..<4) { col in
                            let index = row * 4 + col
                            if index < deck.cards.count {
                                Image(deck.cards[index].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 80)
                                    .cornerRadius(8)
                                    .padding(4)
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 70, height: 80)
                                    .foregroundStyle(.gray.opacity(0.6))
                                    .padding(4)
                            }
                        }
                    }
                }

                HStack {
                    Image("elixir")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(20)
                    Text(String(format: "%.1f", deck.averageElixir))
                        .font(.title)

                    Spacer()

                }
            }
        }*/
    }
}



