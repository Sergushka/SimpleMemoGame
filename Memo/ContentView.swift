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
                        withAnimation(.linear(duration: self.animationDuration)) {
                            self.emojiGame.choose(card: card)
                        }
                    }
                        .padding()
                    }
                Text("SCORE: \(emojiGame.getScore())").font(Font.title)
            } else {
                Button(action: {
                    self.emojiGame.startNewGame()
                }, label: { Text("Start New Game") })
                    .font(Font.largeTitle)
            }
    }
    
    private let animationDuration = 0.75
}

struct MyView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            if self.card.isFaceUp || !self.card.isMatched {
                ZStack {
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 110-90)).padding(self.piePadding).opacity(self.pieOpacity)
                    Text(self.card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontScaling))
                        .rotationEffect(Angle.degrees(self.card.isMatched ? 360 : 0))
                        .animation(self.card.isMatched ? Animation.linear(duration: 1.5).repeatForever(autoreverses: false) : .default)
                }
                    .cardify(isFaceUp: self.card.isFaceUp)
                    .transition(.scale)
            }
        }
    }
    
    private let fontScaling: CGFloat = 0.8
    private let piePadding: CGFloat = 5
    private let pieOpacity = 0.4
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return ContentView(emojiGame: game)
    }
}
