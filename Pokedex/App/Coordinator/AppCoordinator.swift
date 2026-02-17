//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 14.12.25.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {
    
    //MARK: Properties
    
    var navigationController: UINavigationController?
    
    
    //MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Methods
    
    func start() {
        handle(.listVc)
    }
    
    private func showHomePage() {
        let viewModel = PokemonViewModel()
        let listViewController = ListViewController(viewModel: viewModel, coordinator: self)
        navigationController?.pushViewController(listViewController, animated: true)
    }
    
    func navigateToPokemonDetails(_ pokemon: Pokemon) {
       let detailsView = DetailsView(pokemon: pokemon)
            .environment(\.navigate) { [weak self] route in
                self?.handle(route)
            }
        let detailsViewController = UIHostingController(rootView: detailsView)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    private func handle(_ destination: Destination) {
        switch destination {
        case .listVc:
            showHomePage()
        case .detailsView(let pokemon):
            navigateToPokemonDetails(pokemon)
        case .navigateBack:
            navigationController?.popViewController(animated: true)
        }
    }
}
