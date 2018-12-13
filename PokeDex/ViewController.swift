//
//  ViewController.swift
//  PokeDex
//
//  Created by Greg Hughes on 12/10/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var pokeSearchBar: UISearchBar!
    
    @IBOutlet weak var pokeImageView: UIImageView!
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    
    @IBOutlet weak var pokeWeightLabel: UILabel!
    
    @IBOutlet weak var pokeIDLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        pokeSearchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, searchText != "" else {
            return
        }
        PokemonController.searchForPokemon(by: searchText) { (pokemon) in
            
            DispatchQueue.main.async {
                guard let pokemon = pokemon else {return}
                self.pokeSearchBar.text = ""
                self.pokeNameLabel.text = pokemon.name
                self.pokeIDLabel.text = "\(pokemon.id)"
                self.pokeWeightLabel.text = "\(pokemon.weight)"
            }
            // we never used a URL, why does this work
            PokemonController.getPokemonImage(by: pokemon!, completion: { (image) in
                DispatchQueue.main.async {
                 self.pokeImageView.image = image
                }
            })
        }
    }
}

