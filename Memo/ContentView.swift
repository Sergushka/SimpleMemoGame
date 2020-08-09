//
//  ContentView.swift
//  Memo
//
//  Created by Alexander on 07.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    var body: some View {
        bodyView().foregroundColor(EmojiMemoryGame.theme.color)
    }
    
    @ViewBuilder private func bodyView() -> some View {
            if !emojiGame.isGameOver() {
                Text(EmojiMemoryGame.theme.name.uppercased()).font(Font.title)
                Grid(emojiGame.cards) {card in
                    MyView(card: card).onTapGesture {
                        self.emojiGame.choose(card: card)
                    }
                        .padding()
                    }
                Text("SCORE: \(emojiGame.getScore())").font(Font.title)
            } else {
                Button("Start New Game", action: {
                    self.emojiGame.startNewGame()
                })
                    .font(Font.largeTitle)
            }
    }
}

struct MyView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            if self.card.isFaceUp || !self.card.isMatched {
                ZStack {
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 110-90)).padding(5).opacity(0.4)
                    Text(self.card.content).font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontScaling))
                }.cardify(isFaceUp: self.card.isFaceUp)
            }
        }
    }
    
    private let fontScaling: CGFloat = 0.8
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return ContentView(emojiGame: game)
    }
}
