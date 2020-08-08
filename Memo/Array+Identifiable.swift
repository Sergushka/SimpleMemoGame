//
//  Array+Identifiable.swift
//  Memo
//
//  Created by Alexander on 08.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for i in 0..<self.count {
            if self[i].id == matching.id {
                return i
            }
        }
        return nil
    }
}
