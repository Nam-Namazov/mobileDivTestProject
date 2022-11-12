//
//  CharacterPresenter.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

protocol CharacterPresenterInput: AnyObject {
    
}

protocol CharacterPresenterOutput: AnyObject {
    func reloadTableView()
}
