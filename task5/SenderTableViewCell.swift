//
//  SenderTableViewCell.swift
//  task5
//
//  Created by Sierra 4 on 16/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class SenderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblsendTime: UILabel!
    @IBOutlet weak var lblSender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.awakeFromNib()
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date )
        let minute = Calendar.current.component(.minute, from:  date)
        lblsendTime.text  = "\(hour):" + "\(minute)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
