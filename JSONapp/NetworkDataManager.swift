//
//  NetworkDataManager.swift
//  JSONapp
//
//  Created by Михаил Малышев on 27/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//
//
//import Foundation
//
//struct NetworkDataManager {
//    
//    static var shared = NetworkDataManager()
//    
//    var fact: FactAboutCat?
//    
//    private init() {}
//    
//    static func getRandomCatFact() -> FactAboutCat? {
//        let randomFactUrl = "https://catfact.ninja/fact"
//        
//        guard let url = URL(string: randomFactUrl) else { return nil }
//        
//           URLSession.shared.dataTask(with: url) { (data, _, _) in
//               guard let data = data else { return }
//               let decoder = JSONDecoder()
//               DispatchQueue.main.async {
//                   do {
//                    NetworkDataManager.shared.fact = try decoder.decode(FactAboutCat.self, from: data)
//                   } catch let error {
//                       print(error)
//                   }
//               }
//           }.resume()
//        return NetworkDataManager.shared.fact
//}
//}
