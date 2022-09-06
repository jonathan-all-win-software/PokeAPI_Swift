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
        var pokemones: [Pokemon] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
    //        register new cell
            tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

            apiManager.delegado = self
            
            tableView.delegate = self
            tableView.dataSource = self
            
    //        Search List
            apiManager.showPokemon()
        }
    }


    //Delegate Pokemones
    extension ViewController: ApiManagerDelegate {
        func showPokemonList(list: [Pokemon]) {
            
            pokemones = list
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //    Count Rows
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pokemones.count;
            
        }
        
    //    Send Data to the cell
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
            let cellSelected = pokemones[indexPath.row]
            cell.name.text = cellSelected.name
            
            //        Show image for URL
            cell.imageAPI.sd_setImage(with: URL(string: cellSelected.imageUrl))
            
            return cell
        }
        
    //    Catch cell selected
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let viewController = DetailViewController()
            viewController.seeDetail = pokemones[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)


    //        Deselected Row
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }


