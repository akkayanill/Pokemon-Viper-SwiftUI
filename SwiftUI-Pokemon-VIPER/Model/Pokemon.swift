//
//  Pokemon.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 3.01.2022.
//

import Foundation


struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

//let MOCK_POKEMON: [Pokemon] = [
//    .init(id: 0, name: "Balbasaur", imageUrl: "1", type: "poison"),
//    .init(id: 1, name: "Balbasaur", imageUrl: "1", type: "poison"),
//    .init(id: 2, name: "Balbasaur", imageUrl: "1", type: "poison"),
//    .init(id: 3, name: "Balbasaur", imageUrl: "1", type: "poison"),
//    .init(id: 4, name: "Balbasaur", imageUrl: "1", type: "poison"),
//    .init(id: 5, name: "Balbasaur", imageUrl: "1", type: "poison")
//]
