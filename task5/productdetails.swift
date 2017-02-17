//
//  productdetails.swift
//  task5
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import Foundation
 class productdetails
 {
    var name : String?
    var message : String?
    var time : String?
    var amount: String?
    var picturedata: URL?
    
    init(name: String? , message: String? ,time: String?, amount: String? , picturedata:URL?)
    {
        self.name = name
        self.message = message
        self.time = time
        self.amount = amount
        self.picturedata = picturedata
    }
    

}
