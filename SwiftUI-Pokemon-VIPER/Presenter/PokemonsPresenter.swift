//
//  PokemonViewModel.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 3.01.2022.
//

import SwiftUI

///Can't turn this into a protocol - SwiftUI Language Barrier
class PokemonsPresenterProtocol: ObservableObject {
    @Published var pokemons = [Pokemon]()
    
    func onAppear() {}
}

class PokemonsPresenter: PokemonsPresenterProtocol{
    
    private var interactor: PokemonsInputInteractorProtocol
    private var router: PokemonsRouterProtocol!
    
    
    init(interactor: PokemonsInputInteractorProtocol,
         router: PokemonsRouterProtocol) {
        self.interactor = interactor
        self.router = router
        
    }
    
    override func onAppear() {
        self.interactor.outputDelegate = self
        self.interactor.fetchPokemons()
    }
}

// MARK: - PokemonsOutpuInteractorProtocol
extension PokemonsPresenter: PokemonsOutpuInteractorProtocol {
    func didReceived(error: Error) {
        // TODO: - show error 
    }
    
    func didReceived(pokemons data: [Pokemon]) {
        self.pokemons = data
    }
}
