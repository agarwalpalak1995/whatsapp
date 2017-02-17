//
//  Productdetails+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 17/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Productdetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Productdetails> {
        return NSFetchRequest<Productdetails>(entityName: "Productdetails");
    }

    @NSManaged public var name: String?
    @NSManaged public var messages: NSSet?

}

// MARK: Generated accessors for messages
extension Productdetails {

    @objc(addMessagesObject:)
    @NSManaged public func addToMessages(_ value: Usermessages)

    @objc(removeMessagesObject:)
    @NSManaged public func removeFromMessages(_ value: Usermessages)

    @objc(addMessages:)
    @NSManaged public func addToMessages(_ values: NSSet)

    @objc(removeMessages:)
    @NSManaged public func removeFromMessages(_ values: NSSet)

}
