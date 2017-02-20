//
//  Chatmessage+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 19/02/17.
//
//

import Foundation
import CoreData


extension Chatmessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chatmessage> {
        return NSFetchRequest<Chatmessage>(entityName: "Chatmessage");
    }

    @NSManaged public var id: String?
    @NSManaged public var message: String?
    @NSManaged public var usermessage: String?

}
