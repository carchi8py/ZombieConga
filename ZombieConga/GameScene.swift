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
    let zombieMovePointsPerSec: CGFloat = 480.0
    var velocity = CGPointZero
    
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
        moveSprite(zombie, velocity: CGPoint(x: zombieMovePointsPerSec, y: 0))
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        println("\(dt*1000) milliseconds since last update")
    }
    
    //Move the zombie at zombieMovePointsPerSec per second
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint) {
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt),
                                   y: velocity.y * CGFloat(dt))
        println("Amount to move: \(amountToMove)")
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x,
                                  y: sprite.position.y + amountToMove.y)
    }
    
    //Moves the zombie towards a location
    func moveZombieToward(location: CGPoint) {
        let offset = CGPoint(x: location.x - zombie.position.x,
                             y: location.y - zombie.position.y)
        let length = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        let direction = CGPoint(x: offset.x / CGFloat(length),
                              y: offset.y / CGFloat(length))
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec,
                           y: direction.y * zombieMovePointsPerSec)
    }
}