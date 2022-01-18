//
//  PokemonEndppoint.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 18.01.2022.
//

import Alamofire

enum PokemonEndpoint: EndpointType {
    
    case getExample
    var baseURL: URL {
        URL(string: "https://pokedex-bb36f.firebaseio.com")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .getExample:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .getExample:
            return "/pokemon.json"
        }
    }
}
