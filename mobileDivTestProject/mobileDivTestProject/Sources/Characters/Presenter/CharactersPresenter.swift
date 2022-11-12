//
//  CharactersPresenter.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import Foundation

final class CharactersPresenter {
    
    private weak var view: CharacterTableViewInput?
    private var page = 1
    private var characters: [RickMortyCharacter] = []
    private var isDownloadInProgress = false
    
    init(view: CharacterTableViewInput) {
        self.view = view
    }
    
    private func fetchCharacters() {
        view?.showLoading()
        isDownloadInProgress = true
        NetworkManager.shared.getCharacters(page: page) { [weak self] result in
            switch result {
            case .success(let data):
                self?.characters.append(contentsOf: data)
                self?.view?.reloadTableView()
                self?.page += 1
            case .failure(let error):
                print("error is \(error)")
            }
            self?.isDownloadInProgress = false
            self?.view?.hideLoading()
        }
    }
}

// MARK: - CharacterTableViewOutput
extension CharactersPresenter: CharacterTableViewOutput {
    func scrolledToTheEnd() {
        if !isDownloadInProgress && page <= 42 {
            fetchCharacters()
        }
    }
    
    func viewDidLoad() {
        fetchCharacters()
    }
    
    func watchEpisodePressed(at index: Int) {
        print("Watch episode triggered at \(index)")
    }
    
    func cellModelForRow(at index: Int) -> RickMortyCharacter {
        return characters[index]
    }
    
    func numberOfRows() -> Int {
        return characters.count
    }
}
