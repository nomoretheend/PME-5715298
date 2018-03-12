//
//  Res.swift
//  PME-5715298
//
//  Created by never on 3/12/18.
//  Copyright © 2018 CS3432. All rights reserved.
//

import Foundation

struct Res: Decodable {
    var name: String
    var location: String
    var cuisines: String
    var averageCost: String
    var hours: String
    var rating: Double
    var image: String
    var imageGallery = [String]()
        
    /*
    "name" : "Lilou Cafe",
    "location" : "The Yard Hostel, Phahonyothin Road, Bangkok",
    "cuisines" : "International Food - Vegeterian & Dessert Cafe",
    "averageCost" : "100 - 300 Baht per person",
    "hours" : "10.00 AM to 18.00 PM",
    "rating" : 4.7,
    "image" : "res2.png",
    "imageGallery" : [
    "res2_00.png",
    "res2_01.png",
    "res2_02.png",
    "res2_03.png",
    "res2_04.png"
    ]
 */
}
