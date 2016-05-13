//
//  Player.swift
//  BlackJack
//
//  Created by Camille on 12/05/16.
//  Copyright © 2016 Fares - Camille. All rights reserved.
//

import Foundation

class Player {
    
    var id:Int
    var mise:Int
    var totalMoney:Int
    var tour:Int
    var endToPlayed:Bool
    
    init(_id:Int,_totalMoney:Int)
    {
        self.id = _id
        self.mise = 0
        self.totalMoney = _totalMoney
        self.tour = 0
        self.endToPlayed = false
    }
    
    var playerCards = Array<Card>()
    var playerCardsSplited = Array<Card>()
    
    //Renvoie Vrai si le joueur peut miser
    func bet(_mise:Int)
    {
        self.mise = _mise
        //Retire la mise souhaiter au total
        self.totalMoney -= self.mise
    }
    
    func canPlay()->Bool
    {
        if(globalFunction().calcPoints(self.playerCards) <= 21)
        {
            return true
        }
        return false
    }
    
    // Coupe les cartes au début de la partie
    func cutCard()
    {
        
    }
    
    //Recois une carte a son jeu
    func ReceiveCard(oCroupier:Croupier)
    {
        playerCards.append(oCroupier.distributeCardToPlayers())
    }
    
    //Le joueur demande une carte
    func hint(oCroupier:Croupier)
    {
        self.ReceiveCard(oCroupier)
    }
    
    //Vérifie que l'utilisateur peut jouer le double
    func canDouble()->Bool
    {
        let points = self.calcPoints()
        
        //Si le totoal des points du joeur et de 10,11 ou 12
        if(points == 10 || points == 11 || points == 12)
        {
            return true
        }
        return false
    }
    
    //Le jouer joue le double
    func double(oCroupier:Croupier)
    {
        self.ReceiveCard(oCroupier)
        
        //Multiplie la mise par 2
        self.mise *= 2
    }
    
    //Vérifie que l'utilisateur peut jouer le split
    func canSplit()->Bool
    {
        //Vérifie qu'il ya bien les deux cartes
        if(self.playerCards.count == 2)
        {
            if(self.playerCards[0].code == self.playerCards[1].code)
            {
                return true
            }
        }
        return false
    }
    
    //Le joueur joue le split
    func split()
    {
        //Delete la première carte du jeu du joueur et la place dans la seconde liste (Splited)
        self.playerCardsSplited[0] =  self.playerCards.removeFirst()
        
       //Ajoute la même mise de base sur sa deuxième lste de cartes (Splited)
        self.mise += self.mise
    }
    
    //Le joeur reste
    func stand()
    {
        self.endToPlay()
    }
    
    //Vérifie si le joueur  BlackJack
    func hasBlackJack()->Bool
    {
        if(globalFunction().calcPoints(playerCards)==21)
        {
            return true
        }
        return false
    }
    
    
    //Le joueur prend l'assurance (ici on sait que c'est dispponible pour le joueur)
    //Retourne False si la mise est supérieur à la mise de base
    func assurance(_mise:Int)->Bool
    {
        //Si la mise est inférieur égal à la mise de base
        if(_mise <= self.mise)
        {
            self.mise += _mise
            self.endToPlay()
            return true
        }
        return false
    }
    
    
    //Le joueur abandonne son jeu
    func abandon(oCroupier:Croupier)
    {
        self.mise = self.mise/2
        oCroupier.burnCards(playerCards)
        self.endToPlay()
    }
    
    func calcPoints()->Int
    {
        return globalFunction().calcPoints(playerCards)
    }
    
    //Replace la mise dans TotalMoney
    func UpdateTotalMoney()
    {
        self.totalMoney += self.mise
        self.mise = 0
    }
    
    //Le joueur a fini son tour
    func miseThreeTwo()
    {
        self.mise = self.mise + self.mise/2
        self.endToPlay()
    }
    
    //Le joueur a fini son tour
    func endToPlay()
    {
        self.endToPlayed = true
    }
    
}
