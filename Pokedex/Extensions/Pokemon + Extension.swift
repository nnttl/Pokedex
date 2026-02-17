//
//  Pokemon + Extension.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

extension Pokemon {
    func getThemeColor(for pokemon: Pokemon) -> Color {
        let type = pokemon.types[0].type.name.capitalized
        return Color(type)
    }
}
