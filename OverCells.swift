//
//  OverCells.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/13/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class Tile : SKSN {
    
    var num : Int
    
    init() {
        
        num = -1
        let text = SKT(imageNamed: "empty")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        
    }
    init(num: Int) {
        
        self.num = num
        
        let text = SKT(imageNamed: "tile")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        
        zPosition = 1
        anchorPoint = CGP(x: 0, y: 0)
    }
    init(num: Int, img: String) {
        
        self.num = num
        
        let text = SKT(imageNamed: img)
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        
        zPosition = 1
        anchorPoint = CGP(x: 0, y: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Button : Tile {
    
    var door = pr(a: 0, b: 0)
    var pressed = false
    
    override init() {
        super.init()
    }
    init(num: Int, door : pr) {
        
        self.door = door
        super.init(num: num, img: "button")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}