//
//  ViewController.swift
//  ApiPractice
//
//  Created by User-X09 on 8/30/22.
//

import UIKit
import SDWebImage

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    //   Variables
    var apiManager = ApiManager()
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        register new cell
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        apiManager.delegado = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //        Get Pokemon's Api
        apiManager.getPokemon()
    }
}


//Delegate Pokemones
extension ViewController: ApiManagerDelegate {
    func showPokemonList(items: [Pokemon]) {
        
        pokemons = items
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //    Count Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }
    
    //    Send Data to the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            fatalError("no dequeueReusableCell found")
        }
    
        cell.setUp(pokemon: pokemons[indexPath.row])
        return cell
    }
    
    //    Catch cell selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.pokemon = pokemons[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
                
        //        Deselected Row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
