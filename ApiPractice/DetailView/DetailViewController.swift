//
//  DetailViewController.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var pokemon: Pokemon?
    
//    IBOutlets
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var defense: UILabel!
    @IBOutlet private weak var attack: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUI()
    }
    
    private func getUI() {
        image.sd_setImage(with: URL(string: pokemon?.imageUrl ?? ""))
        defense.text = "Defensa: \(pokemon!.defense)"
        attack.text = "Ataque: \(pokemon!.attack)"
        typeLabel.text = pokemon?.type
        descriptionLabel.text = pokemon?.description
        name.text = pokemon?.name
    }
}
