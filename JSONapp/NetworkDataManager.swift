//
//  NetworkDataManager.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import Foundation
import UIKit

struct NetworkDataManager {
    
    static func getRandomCatFact(fact: FactAboutCat, label: UILabel) {
        let randomFactUrl = "https://catfact.ninja/fact"
        var fact = fact
        
        guard let url = URL(string: randomFactUrl) else { return }
        
           URLSession.shared.dataTask(with: url) { (data, _, _) in
               guard let data = data else { return }
               let decoder = JSONDecoder()
               DispatchQueue.main.async {
                   do {
                    fact = try decoder.decode(FactAboutCat.self, from: data)
                    label.text = fact.fact
                   } catch let error {
                       print(error)
                   }
               }
           }.resume()
}
    
    static func getRandomPic(catImage: CatImage, imageView: UIImageView) {
        let randomPicUrl = "https://aws.random.cat/meow"
        var catImage = catImage
        
            guard let url = URL(string: randomPicUrl) else { return }
    
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                DispatchQueue.global().async {
                    do {
                        catImage = try decoder.decode(CatImage.self, from: data)
                        guard let stringURL = catImage.file else { return }
                        guard let imageURL = URL(string: stringURL) else { return }
                        guard let imageData = try? Data(contentsOf: imageURL) else { return }
                        DispatchQueue.main.async {
                            imageView.image = UIImage(data: imageData)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
}
