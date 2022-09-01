//
//  TableViewCell.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageAPI: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageAPI.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
