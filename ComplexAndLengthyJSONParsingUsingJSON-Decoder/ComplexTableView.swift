//  ComplexTableView.swift
//  ComplexAndLengthyJSONParsingUsingJSON-Decoder
//  Created by Ranjeet Raushan on 29/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class ComplexTableView: UITableViewCell {
    @IBOutlet weak var label_batter_id: UILabel!
     @IBOutlet weak var label_batter_type: UILabel!
     @IBOutlet weak var label_topping_id: UILabel!
     @IBOutlet weak var label_topping_type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
