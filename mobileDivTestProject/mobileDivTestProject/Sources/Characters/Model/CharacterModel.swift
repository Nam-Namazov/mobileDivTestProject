//
//  CharacterModel.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

struct CharacterModel: Decodable {
    let results: [Characters]
}

struct Characters: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
}

struct Location: Decodable {
    let name: String
}
