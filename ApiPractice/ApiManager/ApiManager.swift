//
//  ApiManager.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import Foundation
import UIKit

protocol ApiManagerDelegate {
    func showPokemonList(items:[Pokemon])
}

struct ApiManager {
    var delegado: ApiManagerDelegate?

    //    Get Pokemons
    func getPokemon() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if let error = error {
                    print(error)
                }
                
                if let data = data?.parseData(deleteString: "null,"),
                   let pokemons = self.parsearJSON(apiData: data) {
                    delegado?.showPokemonList(items: pokemons)
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
            print(error.localizedDescription)
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
