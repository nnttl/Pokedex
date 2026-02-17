//
//  ProgressViewStyle.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

struct customProgressView: View {
    
    //MARK: - Properties
    
    let progress: CGFloat
    let color: Color
    
    //MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .foregroundColor(color.opacity(0.2))
                .frame(width: 250, height: 6)
            
            UnevenRoundedRectangle(
                topLeadingRadius: 4,
                bottomLeadingRadius: 4,
                bottomTrailingRadius: 0,
                topTrailingRadius: 0
            )
            .foregroundColor(color)
            .frame(width: progress, height: 4)
        }
    }
}
