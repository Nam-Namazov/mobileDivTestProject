//
//  CharacterViewController.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    private func style() {
        view.backgroundColor = .white
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
