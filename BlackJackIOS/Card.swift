//
//  Card.swift
//  BlackJack
//
//  Created by Camille on 12/05/16.
//  Copyright © 2016 Fares - Camille. All rights reserved.
//

import Foundation

class Card {
    
    var code: String
    var type: String
    var categorie : String //carte normal ou image
    var burn : Bool
    
    init(_code:String,_type:String,_categorie:String,_burn:Bool)
    {
        self.code = _code
        self.type  = _type
        self.categorie = _categorie
        self.burn = _burn
    }
    
    //Brule la card, avec le flag
    func burned()
    {
        self.burn = true
    }
    
    func hasImageCard()->Bool
    {
        if(code == "V" || code == "D" || code == "R")
        {
            return true
        }
        return false
    }
    
    func hasAS()->Bool
    {
        if(code == "1")
        {
            return true
        }
        return false
    }
}
