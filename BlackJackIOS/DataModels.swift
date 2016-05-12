//
//  DataModels.swift
//  BlackJack
//
//  Created by Camille on 12/05/16.
//  Copyright © 2016 Fares - Camille. All rights reserved.
//

import Foundation
struct DataModels {
    
    func LoadPlayer()->Array<Player>
    {
        var Players = [Player]()
        Players.append(Player(_id:1,_totalMoney:320))
        Players.append(Player(_id:2,_totalMoney:250))
        Players.append(Player(_id:3,_totalMoney:670))
        Players.append(Player(_id:4,_totalMoney:510))
        
        return Players
    }
    
    
    func LoadCards()->Array<Card>
    {
        var Cards = [Card]()
        
        //Jeux de cartes
        for _ in 1...6
        {
            //Type
            for i in 1...4
            {
                var type:String=""
                
                switch i{
                case 1:type = "Coeur"
                case 2:type = "Carre"
                case 3:type = "Trefle"
                case 4:type = "Pique"
                default:break
                }
                //Carte chiffre
                for j in 1...10
                {
                    Cards.append(Card(_code: String(j),_type: type,_categorie: "Number",_burn: false))
                    
                }
                Cards.append(Card(_code: "V",_type:"Coeur",_categorie: "Image",_burn: false))
                Cards.append(Card(_code: "D",_type:"Coeur",_categorie: "Image",_burn: false))
                Cards.append(Card(_code: "R",_type:"Coeur",_categorie: "Image",_burn: false))
            }
        }
        return Cards
    }
}