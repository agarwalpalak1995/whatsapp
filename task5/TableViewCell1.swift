//
//  TableViewCell1.swift
//  task5
//
//  Created by Sierra 4 on 07/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var lblnoOFmessage: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lblmessage: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
