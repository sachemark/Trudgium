//
//  Creatures.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/11/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class Creat: SKSN {
    
    var currPos = 0
    var prevPos = 0
    var stPos = 0
    var endPos = 0
    var dir = 0  // direction
    var rad = 2 // radius of visibility
    var spd = NSTimeInterval(0.1) // speed of creat (seconds per cell)
    var active = true
    

    var type = -1 // MrGeorgeous Commit 2/5/16
    
    func bSet() {
    }
    
    func afterInit() {

        anchorPoint = CGP(x: 0, y: 0)
        zPosition = 16
    }
        
    init() {
        let text = SKT(imageNamed: "empty")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        afterInit()
    }
    init(endPos: Int, currPos: Int) {
        
        self.currPos = currPos
        self.stPos = currPos
        self.endPos = endPos
        
        let text = SKT(imageNamed: "creat")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        afterInit()
    }
    init(currPos: Int, img: String) {
        
        self.currPos = currPos
        
        let text = SKT(imageNamed: img)
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        ()
    }
    init(endPos: Int, currPos: Int, img: String) {
        
        self.currPos = currPos
        self.stPos = currPos
        self.endPos = endPos
        
        let text = SKT(imageNamed: img)
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        afterInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Player : Creat {
    
    override init() {
        super.init()
    }
    init(currPos: Int) {
        super.init(currPos: currPos, img: "player")
        self.type = 0
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StrelCreat: Creat {
    
    var farn: CGF
    
    init(farn: CGF, endPos: Int, currPos: Int) {
        self.farn = farn
        
        super.init(endPos: endPos, currPos: currPos, img: "strel-creat")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
