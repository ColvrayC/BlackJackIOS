//
//  globalFunction.swift
//  BlackJackIOS
//
//  Created by Camille on 13/05/16.
//  Copyright © 2016 Fares - Camille. All rights reserved.
//

import Foundation
struct globalFunction
{
    func calcPoints(cards:Array<Card>)->Int
    {
        var nbAS:Int=0
        var points:Int=0
        
        for c in cards
        {
            //Si c'est une image
            if(c.hasImageCard())
            {
                points += 10
            }
            //Si c'est un numéro
            else if(!c.hasImageCard() && !c.hasAS())
            {
                points += Int(c.code)!

            }
            //Si c'est un AS
            else
            {
                nbAS += 1
            }
        }
        
        let pointsAS = calcAS(nbAS,points: points)
        
        if(pointsAS==21)
        {
            points = 21
        }
        else
        {
            points += pointsAS
        }
        
        return points
    }
    
    //Calcul des points de un ou plusieurs AS
    func calcAS(nbAS:Int,points:Int)->Int
    {
        let minPoints:Int=points+minASPoints(nbAS)
        let maxPoints:Int=points+maxASPoints(nbAS)
        
        for i in minPoints...maxPoints
        {
            //Si on atteint 21
            if(i+points == 21)
            {
                return points+i
            }
        }
        //Sinon on retourne le maximum des points des AS, forcement inférieur à 21
        return maxPoints
    }
    
    //Minimum de points des AS
    func minASPoints(nbAS:Int)->Int
    {
        return nbAS*1
    }
    
    //Maximum de points des AS
    func maxASPoints(nbAS:Int)->Int
    {
        return nbAS*11
    }
}