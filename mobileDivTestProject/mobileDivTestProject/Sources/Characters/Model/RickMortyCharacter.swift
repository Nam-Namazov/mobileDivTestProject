//
//  RickMortyCharacter.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

struct RickMortyCharacter: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
}
