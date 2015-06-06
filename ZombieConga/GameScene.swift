//
//  GameScene.swift
//  ZombieConga
//
//  Created by Chris Archibald on 6/5/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let zombie = SKSpriteNode(imageNamed: "zombie1")
    var lastUpdateTime: NSTimeInterval = 0
    var dt: NSTimeInterval = 0
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        
        //Set the background for the game
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        addChild(background)
        
        //Adding a zombie to the game
        zombie.position = CGPoint(x: 400, y: 400)
        zombie.zPosition = 1
        addChild(zombie)
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        zombie.position = CGPoint(x: zombie.position.x + 4,
                                  y: zombie.position.y)
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        println("\(dt*1000) milliseconds since last update")
    }
}