//
//  Cells.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/6/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class Cell : SKSN {
    
//    var a, b : Int
    var num : Int
    var type : Int = 0
    var isK : Bool = false
    

    init() {
        
        num = -1
        
        let text = SKT(imageNamed: "empty")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
    }
    init(num: Int, type: Int) {
        
        self.num = num
        self.type = type
        
        var img : String = "fl"
        
        switch type {
            case 0:
                img = "fl"
            case 1:
                img = "lava"
                isK = true
            case 2:
                img = "wall-cell"
            case 3:
                img = "dark"
            case 4:
                img = "fog"
            default: break
        }
        
        let text = SKT(imageNamed: img)
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        anchorPoint = CGP(x: 0, y: 0)
        type == 0 ? zPosition = 0 : (zPosition = 1)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}