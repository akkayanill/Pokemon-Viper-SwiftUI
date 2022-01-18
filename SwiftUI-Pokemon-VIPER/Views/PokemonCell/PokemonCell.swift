//
//  PokemonCell.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 3.01.2022.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    
    let pokemon: Pokemon
//    let viewModel: PokemonsViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                HStack(spacing: 5) {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding([.bottom, .trailing], 4)
                    
                }
                
            }
        }
        .background(Color(PokemonViewModel.backgroundColor(forType: self.pokemon.type)))
        .cornerRadius(12)
        .shadow(color: Color(PokemonViewModel.backgroundColor(forType: self.pokemon.type)), radius: 6, x: 0, y: 0)

    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell(pok)
//    }
//}
