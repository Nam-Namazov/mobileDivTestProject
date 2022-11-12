//
//  NetworkManager.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let urlString = "https://rickandmortyapi.com/api/character?page="
    
    private init() {}
    
    func getCharacters(page: Int, completion: @escaping (Result<[RickMortyCharacter], Error>) -> Void) {
        guard let url = URL(string: urlString + "\(page)") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error is \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode),
                  let data = data else {
                return
            }
            
            do {
                let characterModel = try JSONDecoder().decode(CharactersResult.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(characterModel.results))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
