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

    @State var isClicked = false
    @State var deckFull = false

    var body: some View {

        VStack(spacing: 4) {
            Button {
                isClicked.toggle()
                print(card.name)
            } label: {
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(8)
                    .shadow(radius: 1)
            }

            if isClicked {
                HStack(spacing: 8) {
                    Button {
                        isClicked = false
                        if deck.cards.contains(where: { $0.name == card.name })
                        {
                            print("\(card.name) already in deck")
                        } else if deck.cards.count < 8 {
                            withAnimation(.spring()) {
                                deck.cards.append(card)  // ✅ Move card into deck
                            }
                            print("Added \(card.name)")
                        } else {
                            deckFull = true
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.green)
                                .frame(width: 60, height: 30)
                            Text("Add")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }
                    .alert("Deck is Full!", isPresented: $deckFull) {
                        Button("OK", role: .cancel) {}
                    }

                    Button {
                        print("See more about \(card.name)")
                        isClicked = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.yellow)
                                .frame(width: 60, height: 30)
                            Text("Info")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .font(.title2)
                        }
                    }
                }
            }
        }

        /*VStack {
            Button {
                print(card.name)
                isClicked.toggle()
            } label: {
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(8)
            }
        
            if isClicked {
                Button {
                    isClicked = false
                    if deck.cards.contains(where: { $0.name == card.name }) {
                        print("\(card.name) is already in deck")
                    } else if deck.cards.count < 8 {
                        withAnimation {
                            deck.cards.append(card)
                        }
                        print("Added \(card.name)")
                    } else {
                        deckFull = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.green)
                            .frame(width: 60, height: 30)
                        Text("Add")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                }
        
                .alert("Deck is Full!", isPresented: $deckFull) {
                    Button("OK", role: .cancel) {}
                }
        
                Button {
                    print("seeing more about \(card.name)")
                    isClicked = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.yellow)
                            .frame(width: 60, height: 30)
                        Text("See More")
                            .foregroundStyle(.white)
                        //.font(.title)
                    }
                }
            }
        }*/

    }

}

