//
//  PokemonController.swift
//  PokeDex
//
//  Created by Greg Hughes on 12/10/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import UIKit
class PokemonController {
    
    static func searchForPokemon(by searchTerm: String, completion: @escaping ((Pokemon?) -> Void)) {
        //Create the URL
        
        let baseURLAsString =  "https://pokeapi.co/api/v2/pokemon/"
        let urlAsString = baseURLAsString + searchTerm.lowercased()
        guard let url = URL(string: urlAsString) else {
            print("URL was not valid")
            completion(nil)
            return }
        print(url.absoluteString)
        
        //Create the URL
        
        
        
        //vv allowing URL to be turned into a pokemon
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            // ^^ turns our url into a pokemon
            if let error = error {
                print("There was an error in \(#function) \(error) : \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("no data was found")
                completion(nil)
                return
                //^^ just in case we werent able to turn data into pokemon
            }
            
            
            
            
            do {
                // vv Decode the PokeMon
                let jsonDecoder = JSONDecoder()
                let pokemon = try jsonDecoder.decode(Pokemon.self, from: data)
                completion(pokemon)
                // ^^ return the pokemon
                
            }
            catch {
                print("There was an error in \(#function) \(error) : \(error.localizedDescription)")
                completion(nil)
            }
        }
        dataTask.resume()
        
    }
    
    
    
    
    //VV why does this work, we never entered a URL
    static func getPokemonImage(by pokemon: Pokemon, completion: @escaping ((UIImage?) -> Void)) {
        
        guard let UrlForImage = URL(string: pokemon.sprites.pokemonImageURLAsString) else {
            return
        }
        
        
        
        let dataTask = URLSession.shared.dataTask(with: UrlForImage) { (data, _, error) in
            if let error = error {
                print("error getting image")
                completion(nil)
                return
            }
            guard let data = data else {
                print(" no data was received for pokemon image")
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
            //give us an image only if data = data
        }
        dataTask.resume()
    }
}

