//
//  DataTableViewCell.swift
//  DataSiswaIDN
//
//  Created by Jun  on 11/16/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var labelkelas: UILabel!
    @IBOutlet weak var labelemail: UILabel!
    @IBOutlet weak var labelnama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
