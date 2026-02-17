//
//  ListViewModel.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import Foundation

final class PokemonViewModel {
    
    //MARK: - Private Properties
    
    private(set) var pokemons: [Pokemon] = []
    
    private var id = 1
    private var limit = 20
    private let maxPokemonId = 10325
    
    //MARK: - Methods
    
    func loadPokemonList() async {
        let endId = min(id + limit - 1, maxPokemonId)
        let idsToFetch = Array(id...endId)
        guard !idsToFetch.isEmpty else { return }
        do {
            var fetchedPokemons: [Pokemon] = []
            try await withThrowingTaskGroup(of: Pokemon.self) { group in
                for id in idsToFetch {
                    group.addTask { try await NetworkService.shared.fetchData(from: API.getPokemonURL(for: id)) }
                }
                for try await pokemon in group {
                    fetchedPokemons.append(pokemon)
                }
            }
            fetchedPokemons.sort { $0.id < $1.id }
            pokemons.append(contentsOf: fetchedPokemons)
            id += limit
        } catch {
            print("Failed to load Pokemons: \(error.localizedDescription)")
        }
    }
}
