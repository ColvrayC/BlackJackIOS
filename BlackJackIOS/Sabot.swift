//
//  Sabot.swift
//  BlackJack
//
//  Created by Camille on 12/05/16.
//  Copyright © 2016 Fares - Camille. All rights reserved.
//

import Foundation

public class Sabot{
    
    var Cards=Array<Card>()
    
    init()
    {
        
    }
    

    
        
    //Supprime la carte du sabot et la renvoie
    func giveCard()->Card
    {
        return Cards.removeLast()
    }
}
