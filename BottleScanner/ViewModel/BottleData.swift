//
//  BottleData.swift
//  BottleScanner
//
//  Created by Thomas DiZoglio on 2/7/23.
//

import Foundation
import SwiftUI

struct BottleData: Hashable, Codable, Identifiable {
    
    var id: Int                     // Bottle Id
    var name: String                // Name of bottle to display
    var sodiumMg: Int               // Sodium in mg of the drink
    var isFavorite: Bool            // Favorite drink of the user
    var sizeOz: Int                 // Size of drink in OZ
    
    private var imageName: String   // Name of image asset to load
    var image: Image {
        Image(imageName)
    }
    
    init() {
        id = 0
        name = ""
        sodiumMg = 0
        isFavorite = false
        sizeOz = 0
        imageName = ""
    }
}
