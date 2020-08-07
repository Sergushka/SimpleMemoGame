//
//  ContentView.swift
//  Memo
//
//  Created by Alexander on 07.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) {index in
                MyView(isFaceUp: true)
            }
        }
            .padding()
            .font(Font.largeTitle)
            .foregroundColor(Color.orange)
    }
}

struct MyView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
