//
//  ExampleService.swift
//  HepsiKurye
//
//  Created by administrator on 4.01.2022.
//

import Alamofire

protocol PokemonsServiceProtocol {
    func getPokemons(completion: @escaping (Result<[Pokemon?], NetworkError>) -> Void)
}

final class PokemonsService: PokemonsServiceProtocol {
    
    private let session = APISession.shared.session
    
    func getPokemons(completion: @escaping (Result<[Pokemon?], NetworkError>
        ) -> Void) {
        session.request(
            endpoint: PokemonEndpoint.getExample,
            dataType: [Pokemon?].self,
            completion: completion
        )
    }
}
