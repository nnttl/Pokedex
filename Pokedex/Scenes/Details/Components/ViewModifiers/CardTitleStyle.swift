//
//  CardTitleStyle.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//


import SwiftUI

struct CardTitleStyle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
            .font(.custom("Poppins-Bold", size: 18))
    }
}

extension View {
    func cardTitleStyle(color: Color) -> some View {
        self.modifier(CardTitleStyle(color: color))
    }
}
