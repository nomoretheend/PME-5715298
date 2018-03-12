//
//  Restaurant+CoreDataProperties.swift
//  PME-5715298
//
//  Created by never on 3/12/18.
//  Copyright © 2018 CS3432. All rights reserved.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var cuisines: String?
    @NSManaged public var averageCost: String?
    @NSManaged public var hours: String?
    @NSManaged public var rating: Double
    @NSManaged public var image: String?
    @NSManaged public var imageGallery: [String]?

}
