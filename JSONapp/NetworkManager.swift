//
//  NetworkDataManager.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getRandomCatFact(from url: String, with complition: @escaping (FactAboutCat) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let fact = try decoder.decode(FactAboutCat.self, from: data)
                complition(fact)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func getRandomPic(from url: String, with complition: @escaping (CatImage) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let randomPic = try decoder.decode(CatImage.self, from: data)
                complition(randomPic)
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }.resume()
    }
}
