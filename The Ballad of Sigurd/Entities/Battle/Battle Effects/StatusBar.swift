//
//  StatusBar.swift
//  The Ballad of Sigurd
//
//  Created by Zach Babb on 3/4/19.
//  Copyright © 2019 Planet Nine. All rights reserved.
//

import Foundation
import SpriteKit

class StatusBar {
    let backgroundNode: SKShapeNode
    var healthNode: SKShapeNode
    var staminaNode: SKShapeNode
    var magicNode: SKShapeNode
    let nodeSize = CGSize(width: 300, height: 120)
    let healthNodeSize = CGSize(width: 280, height: 50)
    let otherNodeSize = CGSize(width: 280, height: 25)
    
    init(location: CGPoint) {
        backgroundNode = SKShapeNode(rectOf: nodeSize)
        backgroundNode.position = location
        backgroundNode.zPosition = ZPositions.entity.rawValue
        backgroundNode.lineWidth = 0
        
        healthNode = SKShapeNode(rectOf: healthNodeSize)
        healthNode.position = CGPoint(x: 0, y: 65)
        healthNode.fillColor = UIColor.green
        healthNode.glowWidth = 2
        
        staminaNode = SKShapeNode(rectOf: otherNodeSize)
        staminaNode.position = CGPoint(x: 0, y: 35)
        staminaNode.fillColor = UIColor.red
        
        magicNode = SKShapeNode(rectOf: otherNodeSize)
        magicNode.position = CGPoint(x: 0, y: 5)
        magicNode.fillColor = UIColor.blue
        
        backgroundNode.addChild(healthNode)
        backgroundNode.addChild(staminaNode)
        backgroundNode.addChild(magicNode)
    }
    
    func updateStatusBar(staminaRatio: Double, magicRatio: Double) {
        let staminaWidth = otherNodeSize.width * CGFloat(staminaRatio)
        let magicWidth = otherNodeSize.width * CGFloat(magicRatio)
        staminaNode.removeFromParent()
        magicNode.removeFromParent()
        staminaNode = SKShapeNode(rectOf: CGSize(width: staminaWidth, height: 25))
        staminaNode.position = CGPoint(x: 0, y: 35)
        staminaNode.fillColor = UIColor.red
        magicNode = SKShapeNode(rectOf: CGSize(width: magicWidth, height: 25))
        magicNode.position = CGPoint(x: 0, y: 5)
        magicNode.fillColor = UIColor.blue
        backgroundNode.addChild(staminaNode)
        backgroundNode.addChild(magicNode)
    }
}
