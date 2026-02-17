//
//  Coordinator.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    func start()
    func navigateToPokemonDetails(_ pokemon: Pokemon)
}
