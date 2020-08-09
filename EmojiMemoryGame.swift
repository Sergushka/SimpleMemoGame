//
//  EmojiMemoryGame.swift
//  Memo
//
//  Created by Alexander on 07.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    static var theme: Theme = Theme.allCases[Int.random(in: 0..<Theme.allCases.count)]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String]
        theme = Theme.allCases[Int.random(in: 0..<Theme.allCases.count)]
        
        switch theme {
            case .sport:
                emojis = ["⚽️","🥎","🏀","🏈","🏐","🏅"]
            case .animals:
                emojis = ["🦙","🦛","🦝","🦘","🦚","🦜"]
            case .halloween:
                emojis = ["👹","👺","😈","🎃","👻","🥶"]
            case .summer:
                emojis = ["☀️","🌞","⛱","🍉","🀧","🌚"]
            case .winter:
                emojis = ["☃️","❄️","🎿","🏂","⛷","🀩"]
            case .technology:
                emojis = ["👩🏻‍💻","📀","⌚️","📱","📸","🕹"]
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...4)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func isGameOver() -> Bool {
        game.isGameOver
    }
    
    func startNewGame() -> Void {
       game = EmojiMemoryGame.createMemoryGame()
    }
    
    func getScore() -> Int {
        game.score
    }
}
