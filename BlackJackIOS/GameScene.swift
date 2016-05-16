//
//  GameScene.swift
//  BlackJackIOS
//
//  Created by Camille on 12/05/16.
//  Copyright (c) 2016 Fares - Camille. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let croupier = Croupier()
    
    var player: Array<Player> = DataModels().LoadPlayer()
    
    
    override func didMoveToView(view: SKView) {
        

        let background = SKSpriteNode(imageNamed: "images 2.jpg")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.size = self.size
        background.zPosition = -2
        self.addChild(background)
        
        let DosCarte = SKSpriteNode(imageNamed: "dosdecarte.jpg")
        DosCarte.anchorPoint = CGPoint(x: 0, y: 0)
        DosCarte.position = CGPoint(x:50, y:400)
        DosCarte.size = CGSize(width: 133, height: 200)
        DosCarte.zPosition = -1
        self.addChild(DosCarte)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}