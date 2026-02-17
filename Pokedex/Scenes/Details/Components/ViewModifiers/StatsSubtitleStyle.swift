//
//  StatsSubtitleStyle.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

struct BaseStatsSubtitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Poppins-Regular", size: 12))
            .foregroundStyle(.font)
    }
}

extension View {
    func statsSubitleStyle() -> some View {
        self.modifier(BaseStatsSubtitleModifier())
    }
}
