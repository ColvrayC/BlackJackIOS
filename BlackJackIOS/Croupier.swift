//
//  Croupier.swift
//  BlackJack
//
//  Created by Camille on 12/05/16.
//  Copyright © 2016 Fares - Camille. All rights reserved.
//

import Foundation

class Croupier {
    
    var oSabot:Sabot
    init()
    {
        oSabot = Sabot()
    }
    var CroupierCards = Array<Card>()
    
    
    //Le croupier mélangeles cartes
    func mixedCards()
    {
        oSabot.mixedCards()
    }
    
    //Le croupier coupe le tas en enlevant le contenu entre la carte bleu et rouge
    func cutCards()
    {
        
    }
    
    //Le croupier place sa carte Rouge
    func redCards()
    {
        
    }
    
    //Le croupier brule une/des cartes ?
    func burnedCards()
    {
        
    }
    
    //Le croupier distribue les cartes aux joueurs
    func distributeCardToPlayers()->Card
    {
        return oSabot.giveCard()
    }
    
    //Le croupier se distribue sa première carte
    func distributeOneCardItSelf()
    {
        CroupierCards.append(oSabot.giveCard())
    }
    
    //Return vrai si le croupir a un AS
    func hasAS()->Bool
    {
        for Card in CroupierCards
        {
            if(Card.code=="1")
            {
                return true
            }
        }
        return false
    }
}
