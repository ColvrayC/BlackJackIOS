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
    
    var croupierCards = Array<Card>()
    var burnedCards = Array<Card>()
    
    //Le croupier mélangeles cartes
    func mixedCards()
    {
        self.oSabot.mixedCards()
    }
    
    //Le croupier coupe le tas en enlevant le contenu entre la carte bleu et rouge
    func cutCards()
    {
        
    }
    
    //Le croupier place sa carte Rouge
    func redCards()
    {
        
    }
    
    //Le croupier brule une carte
    func burnCard(card:Card)
    {
        burnedCards.append(card)
    }
    
    //Le croupier brule des cartes
    func burnCards(cards:Array<Card>)
    {
        for c in cards
        {
            burnedCards.append(c)
        }
    }
    
    //Le croupier distribue les cartes aux joueurs
    func distributeCardToPlayers()->Card
    {
        let card = self.oSabot.giveCard()
        
        //Ajoute la carte au tas de cartes brulées
        self.burnCard(card)
        
        return card
    }
    
    //Le croupier se distribue sa première carte
    func distributeOneCardItSelf()
    {
        let card = self.oSabot.giveCard()
        self.burnCard(card)
        croupierCards.append(card)
    }
    
    //Return vrai si le croupir a un AS
    func hasAS()->Bool
    {
        for Card in self.croupierCards
        {
            if(Card.code=="1")
            {
                return true
            }
        }
        return false
    }
}
