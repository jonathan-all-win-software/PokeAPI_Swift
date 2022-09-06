//
//  DetailViewController.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var seeDetail: Pokemon?
    
//    IBOutlets
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var defense: UILabel!
    @IBOutlet private weak var attack: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.getDetailImage(urlImage: seeDetail?.imageUrl ?? "")
        defense.text = "Defensa: \(seeDetail!.defense)"
        attack.text = "Ataque: \(seeDetail!.attack)"
        typeLabel.text = seeDetail?.type
        descriptionLabel.text = seeDetail?.description
        name.text = seeDetail?.name
    }
}
