//
//  GameScene.swift
//  Space Invaders
//
//  Created by Nick Such on 12/1/15.
//  Copyright (c) 2015 Awesome Inc. All rights reserved.
//

import SpriteKit

var isSpaceship = true

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Space Invaders"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x: 500, y: 10)
        print(CGRectGetMidX(self.frame), self.frame.size.height - 55)
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            var sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            if (isSpaceship == true) {
                isSpaceship = false
            } else {
                sprite = SKSpriteNode(imageNamed:"Pancakes")
                isSpaceship = true
            }
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
//            let action = SKAction.rotateByAngle(CGFloat(2*M_PI), duration:1)
//            let action = SKAction.scaleBy(2, duration: 1)
            
            let action = SKAction.moveByX(CGFloat(0), y: CGFloat(50), duration: 1)
            
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
