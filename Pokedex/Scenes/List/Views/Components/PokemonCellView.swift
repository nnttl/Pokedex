//
//  PokemonCellView.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

struct PokemonCellView: View {
    
    //MARK: - Properties
    
    let pokemon: Pokemon
    
    //MARK: - Body
    
    var body: some View {
        
        VStack(spacing: 0) {
            pokemonIdView
            
            Spacer()
            
            ZStack {
                cellBottomView
                pokemonNameView
                pokemonImage
            }
        }
    }
    
    //MARK: - Subviews
    
    private var pokemonIdView: some View {
        HStack {
            Spacer()
            
            Text(pokemon.id.formatId())
                .foregroundStyle(.customGray)
                .font(.custom("Poppins-Regular", size: 10))
        }.padding(8)
    }
    
    private var cellBottomView: some View {
        RoundedRectangle(cornerRadius: 8).foregroundStyle(.customLightGray)
            .frame(height: 50)
    }
    
    private var pokemonNameView: some View {
        Text(pokemon.name.capitalized)
            .foregroundStyle(.font)
            .font(.custom("Poppins-Regular", size: 12))
            .offset(y: 10)
    }
    
    private var pokemonImage: some View {
        AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { image in
            image
                .frame(height: 0)
                .offset(y: -40)
                .scaleEffect(0.9)
        } placeholder: {
            ProgressView()
                .offset(y: -30)
        }
    }
}
