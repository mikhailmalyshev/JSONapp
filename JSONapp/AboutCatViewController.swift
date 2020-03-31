//
//  ViewController.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import UIKit

class AboutCatViewController: UIViewController {

    @IBOutlet weak var factCatLabel: UILabel!
    @IBOutlet weak var imageCatView: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var nextFactButton: UIButton!
    
    private var fact: FactAboutCat?
    private var catImage: CatImage?
    private let randomFactUrl = "https://catfact.ninja/fact"
    private let randomPicUrl = "https://aws.random.cat/meow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.startAnimating()
        indicatorView.hidesWhenStopped = true
    }
    
    @IBAction func getCatFact() {
        NetworkManager.shared.getRandomCatFact(from: randomFactUrl) { fact in
            self.fact = fact
            DispatchQueue.main.async {
                self.factCatLabel.text = fact.fact
            }
        }
        NetworkManager.shared.getRandomPic(from: randomPicUrl) { randomPic in
            DispatchQueue.global().async {
                self.catImage = randomPic
                guard let stringUrl = self.catImage?.file else { return }
                guard let imageUrl = URL(string: stringUrl) else { return }
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    DispatchQueue.main.async {
                        self.indicatorView.stopAnimating()
                        self.imageCatView.image = UIImage(data: imageData)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        nextFactButton.setTitle("Next Fact", for: .normal)
    }
}
