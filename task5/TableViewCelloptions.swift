//
//  TableViewCelloptions.swift
//  task5
//
//  Created by Sierra 4 on 18/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class TableViewCelloptions: UITableViewCell {
    @IBOutlet weak var lbloption: UILabel!
    var object: labelclass?
    {
        didSet{
            updateUI()
        }
    }
fileprivate func updateUI()
{
    lbloption?.text = object?.label
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
