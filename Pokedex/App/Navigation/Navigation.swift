//
//  Navigation.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import SwiftUI

private struct NavigationHandlerKey: EnvironmentKey {
    static let defaultValue: (Destination) -> Void = { _ in }
}

extension EnvironmentValues {
    var navigate: (Destination) -> Void {
        get {
            self[NavigationHandlerKey.self]
        } set {
            self[NavigationHandlerKey.self] = newValue
        }
    }
}

enum Destination {
    case listVc
    case detailsView(pokemon: Pokemon)
    case navigateBack
}
