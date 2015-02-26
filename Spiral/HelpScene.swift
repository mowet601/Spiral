//
//  HelpScene.swift
//  Spiral
//
//  Created by 杨萧玉 on 14/10/19.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

import SpriteKit

class HelpScene: SKScene {
//    private static let sharedInstance = HelpScene.unarchiveFromFile("HelpScene") as? HelpScene
//    
//    class var sharedHelpScene : HelpScene? {
//        return sharedInstance
//    }
    
    func lightWithFinger(point:CGPoint){
        if let light = self.childNodeWithName("light") as? SKLightNode {
            light.lightColor = SKColor.whiteColor()
            light.position = self.convertPointFromView(point)
        }
    }
    
    func turnOffLight() {
        (self.childNodeWithName("light") as? SKLightNode)?.lightColor = SKColor.blackColor()
    }
    
    func back() {
        let scene = GameScene(size: self.size)
        let flip = SKTransition.flipHorizontalWithDuration(1)
        flip.pausesIncomingScene = false
        self.scene?.view?.presentScene(scene, transition: flip)
        Data.gameOver = false
    }
    
    override func didMoveToView(view: SKView) {
        let bg = childNodeWithName("background") as! SKSpriteNode
        let w = bg.size.width
        let h = bg.size.height
        let scale = max(view.frame.width/w, view.frame.height/h)
        bg.xScale = scale
        bg.yScale = scale
    }
}
