//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Corey Smith on 7/11/17.
//  Copyright © 2017 Corey Smith. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {


    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var discriptionLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet weak var defenceLable: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var pokedexLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var attackLable: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var NextEvoImg: UIImageView!
    @IBOutlet weak var evoLable: UILabel!
    
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLable.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLable.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            // will be called after newtwork call is complete
            self.updateUI()
        }
    }

    func updateUI() {
        attackLable.text = pokemon.attack
        defenceLable.text = pokemon.defense
        heightLable.text = pokemon.height
        weightLable.text = pokemon.weight
        typeLable.text = pokemon.type
        discriptionLable.text = pokemon.description
        
        if pokemon.nextEvoID == "" {
            evoLable.text = "No Evolutons"
            NextEvoImg.isHidden = true
        } else {
            NextEvoImg.isHidden = false
            NextEvoImg.image = UIImage(named: pokemon.nextEvoID)
            let str = "Next Evolution: \(pokemon.nextEvoName) - LVL \(pokemon.nextEvoLevel)"
            evoLable.text = str
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
