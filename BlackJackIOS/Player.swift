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
    var finish:Bool
    
    init(_id:Int,_totalMoney:Int)
    {
        self.id = _id
        self.mise = 0
        self.totalMoney = _totalMoney
        self.finish = true
    }
    
    var PlayerCards = Array<Card>()
    
    //Renvoie Vrai si le joueur peut miser
    func bet(_mise:Int)
    {
        self.mise = _mise
    }
    
    // Coupe les cartes au début de la partie
    func cutCard()
    {
        
    }
    
    //Recois une carte a son jeu
    func takeCard(oCroupier:Croupier)
    {
        PlayerCards.append(oCroupier.distributeCardToPlayers())
    }
    
    //Le joueur demande une carte
    func hint()
    {
        
    }
    
    //Vérifie que l'utilisateur peut jouer le double
    func candouble()->Bool
    {
        let points = calcPoint()
        
        //Si le totoal des points du joeur et de 10,11 ou 12
        if(points == 10 || points == 11 || points == 12)
        {
            return true
        }
        return false
    }
    
    //Le jouer joue le double
    func double()
    {
        
    }
    
    //Vérifie que l'utilisateur peut jouer le split
    func canSplit()
    {
        
        
    }
    
    //Le joueur joue le split
    func split()
    {
        
    }
    
    //Le joeur reste
    func stand()
    {
        
    }
    
    //Vérifie si le joueur  BlackJack
    func hasBlackJack()->Bool
    {
        if(CalcMoney()==21)
        {
            return true
        }
        return false
    }
    
    
    //Le joueur prend l'assurance (ici on sait que c'est dispponible pour le joueur
    func assurance()
    {
        
    }
    
    //Vérifie si le joueur peut abandonner
    func canAbandon()
    {
        
    }
    
    
    //Le joueur abandonne son jeu
    func abandon()
    {
        
    }
    
    func calcPoint()->Int
    {
        return 21
    }
    
    //Calcul l'argent du joueur à la fin de la partie
    func CalcMoney()->Int
    {
        return 21
    }
    
    //Le joueur a fini son tour
    func miseThreeTwo()
    {
        self.mise = self.mise + self.mise/2
    }
    
    //Le joueur a fini son tour
    func finished()
    {
        
    }
    
}
