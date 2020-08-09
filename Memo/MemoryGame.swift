//
//  MemoryGame.swift
//  Memo
//
//  Created by Alexander on 07.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var lastFaceUpCardIndex: Int? {
        get {
            let faceUpCardIndicies = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndicies.count == 1 ? faceUpCardIndicies.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    var isGameOver: Bool {
        get {
            return cards.indices.filter { cards[$0].isMatched }.count == cards.count
        }
    }
    var score: Int = 0
    
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
        if let cardIndex = cards.firstIndex(matching: card), !self.cards[cardIndex].isFaceUp {
            if let lastFaceUpCardIndex = lastFaceUpCardIndex {
                if self.cards[cardIndex].content == self.cards[lastFaceUpCardIndex].content {
                    self.cards[cardIndex].isMatched = true
                    self.cards[lastFaceUpCardIndex].isMatched = true
                    addScore()
                } else if self.cards[cardIndex].isSeen {
                    penalizeScore()
                }
                self.cards[cardIndex].isFaceUp = true
            } else {
                self.lastFaceUpCardIndex = cardIndex
            }
            self.cards[cardIndex].isSeen = true
        }
    }
    
    mutating func addScore() {
        score += 2
    }
    
    mutating func penalizeScore() {
        score = max(0, score - 1)
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
        var content: CardContent
        var id: Int
    }
}
