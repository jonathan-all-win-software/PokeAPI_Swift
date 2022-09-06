//
//  ApiManager.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import Foundation
import UIKit

protocol ApiManagerDelegate {
    func showPokemonList(list:[Pokemon])
}

struct ApiManager {
    var delegado: ApiManagerDelegate?

//    Show Pokemones
    func showPokemon() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    print("Error getting data from API", error?.localizedDescription)
                }
                
                if let secureData = data?.parseData(deleteString: "null,") {
                    if let listAPI = self.parsearJSON(apiData: secureData) {
                        
                        delegado?.showPokemonList(list: listAPI)
                    }
                }
            }
            task.resume()
        }
    }
    
//    ParseJSON
    
    func parsearJSON(apiData: Data) -> [Pokemon]? {
        let decoded = JSONDecoder()
        do {
            let decodedData = try decoded.decode([Pokemon].self, from: apiData)
            return decodedData
        }catch {
            print("Error al decodicaficar los datos: ", error.localizedDescription)
            return nil
        }
    }
}

//  DataAPI
extension Data {
//    Delete word "null," from API
    func parseData(deleteString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

extension UIImageView {
    // Get Image to Details View
    func getDetailImage(urlImage: String) {
        guard let url = URL(string: urlImage) else { return }

        DispatchQueue.main.async {
            if let dataImage = try? Data(contentsOf: url) {
                let loadedImage = UIImage(data: dataImage)
                    self.image = loadedImage
            }
        }
    }
}
