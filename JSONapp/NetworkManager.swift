//
//  NetworkDataManager.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getRandomCatFact(from url: String, with complition: @escaping (FactAboutCat) -> ()) {
        AF.request(url)
            .validate()
            .responseJSON { responseData in
                switch responseData.result {
                case .success(let value):
                    guard let jsonData = value as? [String: Any] else { return }
                    let fact = FactAboutCat(fact: jsonData["fact"] as? String)
                    complition(fact)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func getRandomPic(from url: String, with complition: @escaping (CatImage) -> ()) {
        AF.request(url)
            .validate()
            .responseJSON { responseData in
                switch responseData.result {
                case .success(let value):
                    guard let jsonData = value as? [String: Any] else { return }
                    let catImage = CatImage(imageUrl: jsonData["file"] as? String)
                    complition(catImage)
                case .failure(let error):
                    print(error)
                }
        }
    }
}

