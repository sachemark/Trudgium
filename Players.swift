//
//  Players.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/11/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class Player : SKSN {
    
    var currPos = 19
    var prevPos = 0
    
    init() {
        let texture = SKT(imageNamed: "creat")
        super.init(texture: texture, color: UIC.blackColor(), size: texture.size())
        
        zPosition = 5
        anchorPoint = CGP(x: 0, y: 0)
    }
    init(img: String, currPos: Int) {
        self.currPos = currPos
        let texture = SKT(imageNamed: img)
        super.init(texture: texture, color: UIC.blackColor(), size: texture.size())
        
        zPosition = 5
        anchorPoint = CGP(x: 0, y: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}