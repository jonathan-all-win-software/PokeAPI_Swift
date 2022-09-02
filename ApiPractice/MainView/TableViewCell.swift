//
//  TableViewCell.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet private var pokemonImage: UIImageView!
    @IBOutlet private var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(pokemon: Pokemon) {
        name.text = pokemon.name
        pokemonImage.sd_setImage(with: URL(string: pokemon.imageUrl))
    }
}

