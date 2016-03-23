//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Russ Johnson on 3/13/16.
//  Copyright © 2016 Russ Johnson. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var mainImg: UIImageView!
  @IBOutlet var mainLbl: UILabel!
  @IBOutlet var typeLbl: UILabel!
  @IBOutlet var defenseLbl: UILabel!
  @IBOutlet var heightLbl: UILabel!
  @IBOutlet var weightLbl: UILabel!
  @IBOutlet var pokedexLbl: UILabel!
  @IBOutlet var attackLbl: UILabel!
  @IBOutlet var evoLbl: UILabel!
  @IBOutlet var currentEvoImg: UIImageView!
  @IBOutlet var nextEvoImg: UIImageView!
  
  
  var pokemon: Pokemon!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = pokemon.name
    let img = UIImage(named: "\(pokemon.pokedexId)")
    mainImg.image = img
    currentEvoImg.image = img
    
    pokemon.downloadPokemonDetails({ () -> () in
      // this will run after download is done
      self.updateUI()
    })
  }
  
  func updateUI() {
    mainLbl.text = pokemon.description
    typeLbl.text = pokemon.type
    defenseLbl.text = pokemon.defense
    heightLbl.text = pokemon.height
    weightLbl.text = pokemon.weight
    pokedexLbl.text = "\(pokemon.pokedexId)"
    attackLbl.text = pokemon.attack
    
    if pokemon.nextEvolutionID == "" {
      evoLbl.text = "No Evolutions"
      nextEvoImg.hidden = true
    } else {
      nextEvoImg.hidden = false
      nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
      var str = "Next Evolution: \(pokemon.nextEvolutionText)"
      if pokemon.nextEvolutionLevel != "" {
        str += " - LVL \(pokemon.nextEvolutionText)"
      }
      evoLbl.text = str
    }
    
    
  }
  
  @IBAction func backBtnPressed(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}
