//
//  DetailsView.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

struct DetailsView: View {
    
    
    // MARK: - Environment
    
    @Environment(\.navigate) private var navigate
    
    //MARK: - Properties
    
    let pokemon: Pokemon
    
    private var themeColor: Color {
        pokemon.getThemeColor(for: pokemon)
    }
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            themeColor.ignoresSafeArea()
            
            VStack {
                customNavigationBar
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color.white.shadow(.inner(color: .black.opacity(0.25), radius: 1, x: 0, y: 1)))
                    
                    pokemonImage
                    
                    VStack(spacing: 26) {
                        pokemonTypesView
                        
                        Text("About").cardTitleStyle(color: themeColor)
                        pokemonSizesView
                        
                        Text("Base Stats").cardTitleStyle(color: themeColor)
                            .padding(.bottom, -8)
                        baseStatsView
                        
                        Spacer()
                    }.padding(.vertical, 16)
                        .padding(.top, 40)
                    
                } .frame(height: 500)
                    .padding(8)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    //MARK: - Subviews
    
    private var customNavigationBar: some View {
        HStack {
            Button(action: {
                navigate(.navigateBack)
            }) {
                Image(.backArrow)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
                    .padding(.trailing, 8)
                    .offset(y: 1)
            }
            Text(pokemon.name.capitalized)
                .foregroundStyle(.white)
                .font(.custom("Poppins-Bold", size: 28))
            
            Spacer()
            
            Text(pokemon.id.formatId())
                .foregroundStyle(.white)
                .font(.custom("Poppins-Bold", size: 16))
        }.padding()
    }
    
    private var pokemonImage: some View {
        AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { image in
            image
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 240, height: 240)
                .offset(y: -300)
                .scaleEffect(1.1)
        } placeholder: {
            ProgressView()
                .scaleEffect(1.2)
        }
    }
    
    private var pokemonTypesView: some View {
        HStack(spacing: 16) {
            ForEach (pokemon.types, id: \.self) { type in
                Text(type.type.name.capitalized)
                    .colorsTextStyle(type: type.type.name)
            }
        }
    }
    
    private var pokemonSizesView: some View {
        HStack {
            VStack(spacing: 14) {
                HStack {
                    Image(.bagIcon).scaleEffect(1.1)
                    Text(pokemon.weight.formatWeight())
                        .font(.custom("Poppins-Regular", size: 14))
                }
                Text("Weight")
                    .foregroundStyle(.customGray)
                    .font(.custom("Poppins-Regular", size: 12))
            }.frame(maxWidth: . infinity)
            
            Rectangle().fill(Color.divider)
                .frame(width: 1, height: 60)
            
            VStack(spacing: 14) {
                HStack {
                    Image(.rulerIcon).scaleEffect(1.1)
                    Text(pokemon.height.formatHeight())
                        .font(.custom("Poppins-Regular", size: 14))
                }
                Text("Height").foregroundStyle(.customGray)
                    .font(.custom("Poppins-Regular", size: 12))
            }.frame(maxWidth: . infinity)
        }
    }
    
    private var baseStatsView: some View {
        HStack(spacing: 10) {
            VStack(alignment: .trailing, spacing: 7) {
                Text("HP").statsTitleStyle(color: themeColor)
                Text("ATK").statsTitleStyle(color: themeColor)
                Text("DEF").statsTitleStyle(color: themeColor)
                Text("STAK").statsTitleStyle(color: themeColor)
                Text("SDEF").statsTitleStyle(color: themeColor)
                Text("SPD").statsTitleStyle(color: themeColor)
            }.padding(.trailing, 4)
            
            Rectangle().fill(Color.divider)
                .frame(width: 1, height: 145)
                .padding(.trailing, 4)
            
            VStack(spacing: 8) {
                ForEach(pokemon.stats, id: \.self) { stat in
                    Text(stat.baseStat.formatBaseStats()).statsSubitleStyle()
                }
            }
            
            VStack(spacing: 19) {
                ForEach(pokemon.stats, id: \.self) { stat in
                    customProgressView(progress: CGFloat(stat.baseStat), color: themeColor)
                }
            }
        }
    }
}
