//
//  API.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

struct API {
    static let pokemonBaseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    static func getPokemonURL(for id: Int) -> String {
        "\(pokemonBaseURL)\(id)/"
    }
}
