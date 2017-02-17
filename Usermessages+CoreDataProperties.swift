//
//  Usermessages+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 17/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Usermessages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usermessages> {
        return NSFetchRequest<Usermessages>(entityName: "Usermessages");
    }

    @NSManaged public var message: String?
    @NSManaged public var users: Productdetails?

}
