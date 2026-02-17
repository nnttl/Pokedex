//
//  Pokemon.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

struct PokemonResponse: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Results]
    
    struct Results: Decodable {
        var name: String
        var url: String
    }
}

struct Pokemon: Decodable, Hashable {
    var id: Int
    var name: String
    var sprites: Sprite
    var height: Int
    var weight: Int
    var types: [Types]
    var stats: [Stats]
    
    struct Stats: Decodable, Hashable{
        var baseStat: Int
        var stat: Stat
        
        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case stat
        }
    }
    
    struct Stat: Decodable, Hashable {
        var name: String
    }
    
    struct Sprite: Decodable, Hashable{
        var frontDefault: String
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
    
    struct Types: Decodable, Hashable {
        var slot: Int
        var type: TypeInfo
    }
    
    struct TypeInfo: Decodable, Hashable {
        var name: String
    }
}
