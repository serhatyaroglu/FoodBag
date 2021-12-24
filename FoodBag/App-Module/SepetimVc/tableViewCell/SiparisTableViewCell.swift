//
//  SiparisTableViewCell.swift
//  FoodBag
//
//  Created by serhat yaroglu on 8.12.2021.
//

import UIKit

class SiparisTableViewCell: UITableViewCell {
    var callBackForAddCart:(() -> ())?
    @IBOutlet weak var siparisAdetLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var siparisAdi: UILabel!
    @IBOutlet weak var siparisPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
