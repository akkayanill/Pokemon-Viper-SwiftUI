//
//  PokemonsRouter.swift
//  SwiftUI-Pokemon-VIPER
//
//  Created by Joshua on 3.01.2022.
//

import SwiftUI
import UIKit

protocol PokemonsRouterProtocol {
    func makePokedexView() -> PokedexView
}

final class PokemonsRouter: PokemonsRouterProtocol {
  func makePokedexView() -> PokedexView {
      let service = PokemonsService()
      let interactor: PokemonsInputInteractorProtocol = PokemonsInteractor(service: service)
      let router: PokemonsRouterProtocol = PokemonsRouter()
      let presenter: PokemonsPresenterProtocol = PokemonsPresenter(interactor: interactor, router: router)
      return PokedexView(presenter: presenter)
  }
}

