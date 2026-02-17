//
//  ColorsTextModifier.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

struct ColorsTextModifier: ViewModifier {
    let type: String
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.custom("Poppins-Bold", size: 14))
            .padding(.vertical, 6).padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(Color(type.capitalized)))
    }
}

extension View {
    func colorsTextStyle(type: String) -> some View {
        self.modifier(ColorsTextModifier(type: type))
    }
}
