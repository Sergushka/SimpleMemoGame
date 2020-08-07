//
//  MemoryGame.swift
//  Memo
//
//  Created by Alexander on 07.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentGenerator: (Int) -> CardContent) {
        self.cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentGenerator(pairIndex)
            self.cards.append(Card(content: content, id: pairIndex * 2))
            self.cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        self.cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("You have chosen: \(card)")
        let cardIndex = self.index(of: card)
        self.cards[cardIndex].isFaceUp = !self.cards[cardIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return -1
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
