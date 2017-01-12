//
//  Meal+CoreDataProperties.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/11/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal");
    }

    @NSManaged public var category: String?
    @NSManaged public var directions: String?
    @NSManaged public var image: NSData?
    @NSManaged public var ingridients: String?
    @NSManaged public var title: String?

}
