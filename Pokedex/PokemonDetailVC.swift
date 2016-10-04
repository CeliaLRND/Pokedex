//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by MAC on 04/10/2016.
//  Copyright © 2016 MAC. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelbl.text = pokemon.name
        
        
        let img = UIImage(named: "\(self.pokemon.pokedexId)")
        self.mainImg.image = img
        self.currentEvoImg.image = img
        self.pokedexLbl.text = "\(self.pokemon.pokedexId)"
        
        
        pokemon.downloadPokemonDetail {
            //actions ici se passent apres network call completed
            
            self.updateUI()
            
        }
        
    }

    func updateUI(){
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvoId == "" {
            evoLbl.text = "No evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            let str = "Next Evolution : \(pokemon.nextEvoName!) - LVL \(pokemon.nextEvoLevel!)"
            evoLbl.text = str
        }
        
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
