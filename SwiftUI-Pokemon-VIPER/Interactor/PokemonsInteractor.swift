//
//  PokemonsInteractor.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 3.01.2022.
//

import UIKit

protocol PokemonsInputInteractorProtocol {
    func fetchPokemons()
    var outputDelegate: PokemonsOutpuInteractorProtocol? { get set }
}

protocol PokemonsOutpuInteractorProtocol {
    func didReceived(pokemons data: [Pokemon])
    func didReceived(error: Error)
}

class PokemonsInteractor: PokemonsInputInteractorProtocol {
    
    private struct Constants {
        static let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    }
    
    var outputDelegate: PokemonsOutpuInteractorProtocol?
    var service: PokemonsServiceProtocol
    
    init(service: PokemonsServiceProtocol) {
        self.service = service
    }
    
    func fetchPokemons() {
        service.getPokemons { result
            in
            switch result {
            case .success(let model):
                print("for debug success: \(model.count)")
                var pokemons = model
                pokemons.removeFirst() //dummy code. because api resposne is broken
                self.outputDelegate?.didReceived(pokemons: pokemons as! [Pokemon])
            case .failure(let error):
                print("for debug ERROR: \(error)")
                self.outputDelegate?.didReceived(error: error)
            }
            
        }
    }
    
}
