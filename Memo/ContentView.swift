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
        HStack {
            ForEach(emojiGame.cards) {card in
                MyView(card: card).onTapGesture {
                    self.emojiGame.choose(card: card)
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct MyView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.strokeLineWidth)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontScaling))
        }
    }
    
    // MARK: -Constants
    
    let cornerRadius: CGFloat = 10.0
    let fontScaling: CGFloat = 0.8
    let strokeLineWidth: CGFloat = 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: EmojiMemoryGame())
    }
}
