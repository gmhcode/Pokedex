//
//  Pokemon.swift
//  PokeDex
//
//  Created by Greg Hughes on 12/10/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
struct Pokemon: Codable {
    let name: String
    let weight: Int
    let id: Int
    
    let sprites: Sprite
    
}

struct Sprite: Codable {
    let pokemonImageURLAsString: String
    
    enum CodingKeys: String, CodingKey {
        case pokemonImageURLAsString = "front_default"
    }
}
