//
//  Theme.swift
//  Memo
//
//  Created by Alexander on 08.08.2020.
//  Copyright © 2020 Link. All rights reserved.
//

import SwiftUI

enum Theme: CaseIterable {
    case sport
    case halloween
    case winter
    case summer
    case technology
    case animals
    
    var name: String {
        switch self {
        case .animals:
            return "animals"
        case .halloween:
            return "halloween"
        case .sport:
            return "sport"
        case .summer:
            return "summer"
        case .technology:
            return "technology"
        case .winter:
            return "winter"
        }
    }
    
    var color: Color {
        switch self {
        case .animals:
            return .gray
        case .halloween:
            return .red
        case .sport:
            return .primary
        case .summer:
            return .green
        case .technology:
            return .pink
        case .winter:
            return .blue
        }
    }
}
