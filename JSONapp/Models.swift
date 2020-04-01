//
//  Model.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

struct FactAboutCat: Decodable {
    let fact: String?
}

struct CatImage: Decodable {
    let imageUrl: String?
}
