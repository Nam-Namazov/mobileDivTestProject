//
//  NetworkManager.swift
//  mobileDivTestProject
//
//  Created by Намик on 11/12/22.
//

import UIKit
import Kingfisher

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let urlString = "https://rickandmortyapi.com/api/character"
    
    func getData(completion: @escaping (Result<[Characters], Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error is \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let characterModel = try JSONDecoder().decode(CharacterModel.self, from: data)
                completion(.success(characterModel.results))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
