//
//  CharacterTableViewController.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        tableView.register(
            CharacterTableViewCell.self,
            forCellReuseIdentifier: CharacterTableViewCell.identifier
        )
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource
extension CharacterTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension CharacterTableViewController {
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
