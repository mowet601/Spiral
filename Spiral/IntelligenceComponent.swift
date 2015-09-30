//
//  IntelligenceComponent.swift
//  Spiral
//
//  Created by 杨萧玉 on 15/9/30.
//  Copyright © 2015年 杨萧玉. All rights reserved.
//

import GameplayKit

class IntelligenceComponent: GKComponent {
    let stateMachine: GKStateMachine
    
    init(scene: MazeModeScene, entity: Entity, startingPosition origin: GKGridGraphNode) {
        let chase = ShapeChaseState(scene: scene, entity: entity)
        let flee = ShapeFleeState(scene: scene, entity: entity)
        let defeated = ShapeDefeatedState(scene: scene, entity: entity, respawnPosition: origin)
        let respawn = ShapeRespawnState(scene: scene, entity: entity)
        
        stateMachine = GKStateMachine(states: [chase, flee, defeated, respawn])
        stateMachine.enterState(ShapeChaseState.self)

        super.init()
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        stateMachine.updateWithDeltaTime(seconds)
    }
}