//
//  ViewController.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 13.12.25.
//

import UIKit
import SwiftUI

final class ListViewController: UIViewController {
    
    //MARK: - Private Properties
    
    private let viewModel: PokemonViewModel
    private let coordinator: Coordinator
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokédex"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokeballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "PokeballIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        return imageView
    }()
    
    private let titleHorizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let collectionContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.customLightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pokemonCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 110, height: 115)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 14
        
        flowLayout.sectionInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 8
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - Init
    
    init(viewModel: PokemonViewModel, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "CustomRedBg")
        
        setUpUI()
        loadPokemons()
    }
    
    
    //MARK: - Methods
    
    private func setUpUI() {
        setUpTitleHorizontalStack()
        setUpCollectionContainerView()
        setUpPokemonCollectionView()
    }
    
    private func loadPokemons() {
        Task {
            await viewModel.loadPokemonList()
            pokemonCollectionView.reloadData()
        }
    }
    
    private func setUpTitleHorizontalStack() {
        view.addSubview(titleHorizontalStack)
        
        titleHorizontalStack.addArrangedSubview(pokeballImageView)
        titleHorizontalStack.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleHorizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            titleHorizontalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        ])
    }
    
    private func setUpCollectionContainerView() {
        view.addSubview(collectionContainerView)
        
        NSLayoutConstraint.activate([
            collectionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  8),
            collectionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -8),
            collectionContainerView.topAnchor.constraint(equalTo: titleHorizontalStack.bottomAnchor, constant: 16),
            collectionContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
        ])
        
    }
    
    private func setUpPokemonCollectionView() {
        configureCellCollectionView()
        addCollectionViewConstraints()
    }
    
    private func configureCellCollectionView() {
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reuseIdentifier)
    }
    
    private func addCollectionViewConstraints() {
        collectionContainerView.addSubview(pokemonCollectionView)
        NSLayoutConstraint.activate([
            pokemonCollectionView.leadingAnchor.constraint(equalTo: collectionContainerView.leadingAnchor, constant: 8),
            pokemonCollectionView.trailingAnchor.constraint(equalTo: collectionContainerView.trailingAnchor, constant: -8),
            pokemonCollectionView.topAnchor.constraint(equalTo: collectionContainerView.topAnchor, constant: 24),
            pokemonCollectionView.bottomAnchor.constraint(equalTo: collectionContainerView.bottomAnchor, constant: -8),
        ])
    }
}


// MARK: - UICollectionView Delegate & DataSource

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.reuseIdentifier, for: indexPath) as? PokemonCell else { return UICollectionViewCell() }
        
        cell.contentConfiguration = UIHostingConfiguration {
            PokemonCellView(pokemon: viewModel.pokemons[indexPath.row])
        }.margins(.all, 0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        coordinator.navigateToPokemonDetails(viewModel.pokemons[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastIndex = viewModel.pokemons.count - 1
        if indexPath.item == lastIndex {
            loadPokemons()
        }
    }
}
