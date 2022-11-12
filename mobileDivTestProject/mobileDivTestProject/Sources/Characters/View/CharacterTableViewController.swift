//
//  CharacterTableViewController.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/11/22.
//

import UIKit

final class CharacterTableViewController: UITableViewController {
    
    private var imageUrls = [Characters]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        
        NetworkManager.shared.getData { result in
            switch result {
            case .success(let data):
                self.imageUrls = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("error is \(error)")
            }
        }
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
        tableView.allowsSelection = false
    }
}

// MARK: - UITableViewDataSource
extension CharacterTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.identifier,
            for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(characterImage: imageUrls[indexPath.row].image, characterName: imageUrls[indexPath.row].name, characterGender: imageUrls[indexPath.row].species + ", " + imageUrls[indexPath.row].gender, locationTitle: imageUrls[indexPath.row].location.name, lifeStatus: imageUrls[indexPath.row].status)
        
        return cell
    }
}
