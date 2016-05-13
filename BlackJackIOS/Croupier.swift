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
    var allCards = Array<Card>()
    var burnedCards = Array<Card>()
    
    func getCardsAndMixed()
    {
        //Charge les cartes
        self.allCards = DataModels().LoadCards()
        //Mélange
        self.allCards.shuffle()
    }
    
    //Après que le joueur est passer la carte bleu dans le tas , le croupier
    //coupe le tas de manière a retrouver la carte bleu au dessus
    func putTopCardToBottom(indexBlueCard:Int)
    {
        var cardToDeplace = Array<Card>()
        //récupère de le haut du tas jusqu'a la carte bleu, pour le replacer en dessous
        for i in 0...indexBlueCard-1
        {
            cardToDeplace.append(self.allCards.removeAtIndex(i))
        }

        //ajoute les cartes du haut en dessous du tas
        self.allCards.appendContentsOf(cardToDeplace)

    }
    
    func putRedCard()
    {
        //Random entre 0 et 100, a partir de l'index +20 pour la marge entre la carte bleu et rouge
        let rdm:Int = Int(arc4random_uniform(100))+20
        
        self.allCards.insert(Card(_code:"red",_type:"",_categorie:"",_burn:false), atIndex: rdm)
    }
    
    func putCardsinSabot(){
        oSabot.Cards = self.allCards
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
    
    //Supprime les 5 première cartes et le place dans le tas brulé
    func burnedFirstFiveCards()
    {
        for _ in 1...4
        {
         burnedCards.append(allCards.removeFirst())
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
//Extension Array pour mélanger de manière aléatoire
extension Array {
    mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}

