//
//  GameViewController.swift
//  ZombieConga
//
//  Created by Chris Archibald on 6/5/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    override func viewDidLoad() {
        let scene = GameScene(size:CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        //The order to draw items, baesd on the zPosition
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }


    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
