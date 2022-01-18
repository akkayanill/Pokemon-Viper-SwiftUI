//
//  PokedexView.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 3.01.2022.
//

import SwiftUI

struct PokedexView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    //@StateObject var presenter: PokemonsPresenterProtocol
    @ObservedObject var presenter: PokemonsPresenterProtocol
    
    var body: some View {
        NavigationView { //Navigation Controller like
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 14) {
                    ForEach(presenter.pokemons) { pokemon in
                        PokemonCell(pokemon: pokemon ?? Pokemon(id: 0, name: "dummy", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F5331AA3F-D45A-4BAA-AEEF-A1B02DBA338B?alt=media&token=a905d491-c781-4154-a659-1906a6cdb69a", type: ""))
                  }
                }
            }
            .navigationTitle("Pokedex") // Put this inside NavigationView brackets
        }.onAppear {
            presenter.onAppear()
        }
    }
}

//struct PokedexView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexView(presenter: PokemonsPresenter())
//    }
//}
