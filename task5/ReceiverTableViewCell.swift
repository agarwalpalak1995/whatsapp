//
//  ReceiverTableViewCell.swift
//  task5
//
//  Created by Sierra 4 on 16/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class ReceiverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblreceiveTime: UILabel!
    @IBOutlet weak var lblReceivermessage: UILabel!
    
    @IBOutlet weak var viewreceiver: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      let date = Date()
      let hour = Calendar.current.component(.hour, from: date )
         let minute = Calendar.current.component(.minute, from:  date)
        lblreceiveTime.text  = "\(hour):" + "\(minute)"
        
        // Initialization code
        
       viewreceiver.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
