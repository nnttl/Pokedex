//
//  CollectionViewCell.swift
//  Pokedex
//
//  Created by Natali Zhgenti on 13.12.25.
//

import UIKit
import SwiftUI

final class PokemonCell: UICollectionViewCell {
    
    //MARK: - Static Properties
    
    static let reuseIdentifier = "PokemonCell"
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setUpUI() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 8
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
}
