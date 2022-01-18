//
//  PokemonViewModel.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 18.01.2022.
//

import Foundation
import UIKit

class PokemonViewModel {
    
    static func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire":
            return .systemRed
        case "water":
            return .systemTeal
        case "poison":
            return .systemGreen
        default:
            return .systemPink
        }
    }

}
