//
//  Cardify.swift
//  Memo
//
//  Created by Alexander on 09.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    private let cornerRadius: CGFloat = 10
    private let strokeLineWidth: CGFloat = 3
    
    func body(content: Content) -> some View {
            Group {
                Group {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.strokeLineWidth)
                    content
                }
                    .opacity(isFaceUp ? 1 : 0)
                RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                    .opacity(isFaceUp ? 0 : 1)
            }
                .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
        }
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
