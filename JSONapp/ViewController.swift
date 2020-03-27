//
//  ViewController.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var factCatLabel: UILabel!
    
    @IBOutlet weak var imageCatView: UIImageView!
    let json1 = "https://catfact.ninja/fact"
    let json2 = "https://aws.random.cat/meow"
    
    var fact: FactAboutCat?
    var catImage: CatImage?
    
    @IBAction func getCatFact() {
        getRandomCatFact()
        getRandomPic()
    }
}
    

extension ViewController {
    private func getRandomCatFact() {
        guard let url = URL(string: json1) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            DispatchQueue.main.async {
                do {
                    self.fact = try decoder.decode(FactAboutCat.self, from: data)
                    self.factCatLabel.text = self.fact?.fact
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    private func getRandomPic() {
        guard let url = URL(string: json2) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            DispatchQueue.global().async {
                do {
                    self.catImage = try decoder.decode(CatImage.self, from: data)
                    guard let stringURL = self.catImage?.file else { return }
                    guard let imageURL = URL(string: stringURL) else { return }
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    DispatchQueue.main.async {
                        self.imageCatView.image = UIImage(data: imageData)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}

