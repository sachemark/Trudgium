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
    
    var a = 0, b = 0
    var num = 0
    var type  = 0
    var isK = false
    
    var dl = CGP(x: 0, y: 0)
    var dr = CGP(x: 0, y: 0)
    var ul = CGP(x: 0, y: 0)
    var ur = CGP(x: 0, y: 0)
    
    func afterInit() {
        anchorPoint = CGP(x: 0, y: 0)
        
        dl = position
        dr = CGP(x: position.x + CGF(AppDelegate.Scene!.fieldX), y: position.y)
        ul = CGP(x: position.x, y: position.y + CGF(AppDelegate.Scene!.fieldX))
        ur = CGP(x: position.x + CGF(AppDelegate.Scene!.fieldX), y: position.y + CGF(AppDelegate.Scene!.fieldX))
        switch type {
            case 1: zPosition = 2
            case 2: zPosition = 4
            default: zPosition = 0
        }
    }
    
    init() {
        let text = SKT(imageNamed: "empty")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
    }
    init(num: Int, type: Int) {
        
        self.num = num
        self.type = type
        self.a = num % AppDelegate.Scene!.fieldX  // depends
        self.b = num / AppDelegate.Scene!.fieldX //
        
        var img : String = "standart-cell"
        switch type {
            case 1:
                img = "lava"
                isK = true
            case 2:
                img = "wall-cell"
            default: break
        }
        
        let text = SKT(imageNamed: img)
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        afterInit()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}