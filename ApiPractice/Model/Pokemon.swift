//
//  Pokemon.swift
//  ApiPractice
//
//  Created by User-X09 on 8/31/22.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
