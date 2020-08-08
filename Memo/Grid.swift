//
//  Grid.swift
//  Memo
//
//  Created by Alexander on 08.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: self.items.firstIndex(matching: item)!))
        }
    }
}
