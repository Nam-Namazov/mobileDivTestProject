//
//  CharacterTableViewController.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterTableViewController: UITableViewController {
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private lazy var presenter = CharactersPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        presenter.viewDidLoad()
    }
    
    private func configureUI() {
        activityIndicator.hidesWhenStopped = true
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
        tableView.allowsSelection = false
    }
}

// MARK: - UITableViewDataSource
extension CharacterTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.identifier,
            for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        let character = presenter.cellModelForRow(at: indexPath.row)
        
        cell.configure(characterImage: character.image,
                       name: character.name,
                       species: character.species + ", " + character.gender,
                       location: character.location.name,
                       aliveStatus: character.status)
        cell.onWatchEpisode = { [weak self] in
            self?.presenter.watchEpisodePressed(at: indexPath.row)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CharacterTableViewController {
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.numberOfRows() - 1 {
            presenter.scrolledToTheEnd()
        }
    }
}

// MARK: - CharacterTableViewInput
extension CharacterTableViewController: CharacterTableViewInput {
    func showLoading() {
        navigationItem.titleView = activityIndicator
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        navigationItem.titleView = nil
        activityIndicator.stopAnimating()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
