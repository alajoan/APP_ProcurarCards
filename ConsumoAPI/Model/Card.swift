//
//  Card.swift
//  ConsumoAPI
//
//  Created by Jonathan Alajoan Rocha on 08/03/21.
//

import Foundation
import UIKit
class Card {
    var image: UIImage
    var name: String
    var description: String
    
    init(image: UIImage, name: String, description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
}
