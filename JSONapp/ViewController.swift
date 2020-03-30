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
    
    private var fact: FactAboutCat?
    private var catImage: CatImage?
    
    @IBAction func getCatFact() {
        NetworkDataManager.getRandomCatFact(fact: fact ?? FactAboutCat(fact: "NONE"), label: factCatLabel)
        NetworkDataManager.getRandomPic(catImage: catImage ?? CatImage(file: "https://shop.rusevrosteel.ru/files/products/nophoto_8.800x600.png?957f69c1f2db8aabf806dc1e935a84de"), imageView: imageCatView)
    }
}

