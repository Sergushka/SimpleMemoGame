//
//  Cardify.swift
//  Memo
//
//  Created by Alexander on 09.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    private let cornerRadius: CGFloat = 10
    private let strokeLineWidth: CGFloat = 3
    
    @ViewBuilder func body(content: Content) -> some View {
            if isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.strokeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill()
            }
        }
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
