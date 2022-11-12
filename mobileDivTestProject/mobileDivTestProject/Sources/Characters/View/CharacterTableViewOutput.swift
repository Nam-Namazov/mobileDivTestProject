//
//  CharacterTableViewOutput.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

protocol CharacterTableViewOutput: AnyObject {
    func viewDidLoad()
    func watchEpisodePressed(at index: Int)
    func cellModelForRow(at index: Int) -> RickMortyCharacter
    func numberOfRows() -> Int
    func scrolledToTheEnd()
}
