//
//  EjercicioTableViewCell.swift
//  Restaurante02
//
//  Created by CICE on 8/6/18.
//  Copyright © 2018 alegs0501. All rights reserved.
//

import UIKit

class EjercicioTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
