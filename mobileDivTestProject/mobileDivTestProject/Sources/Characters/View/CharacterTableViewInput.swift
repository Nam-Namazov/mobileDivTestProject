//
//  CharacterTableViewInput.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

protocol CharacterTableViewInput: AnyObject {
    func reloadTableView()
    func showLoading()
    func hideLoading()
}
