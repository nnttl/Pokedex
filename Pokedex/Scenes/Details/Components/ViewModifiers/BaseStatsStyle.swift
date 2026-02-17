//
//  BaseStatsStyle.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

struct BaseStatsModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Poppins-Bold", size: 13))
            .foregroundStyle(color)
    }
}

extension View {
    func statsTitleStyle(color: Color) -> some View {
        self.modifier(BaseStatsModifier(color: color))
    }
}
