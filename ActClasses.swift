//
//  ActClasses.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/23/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class Tap: SKSN {
    
    
    func afterInit() {
        zPosition = 3.5
        anchorPoint = CGP(x: 0, y: 0)
    }
    func getNum(cS: CGF, fieldX: Int) -> Int {
        return Int(trunc(position.y / cS)) * fieldX + Int(trunc(position.x / cS))
    }
    func equal(cS: CGF) {
        position.x = trunc(position.x / cS) * cS + (cS - size.width) / 2
        position.y = trunc(position.y / cS) * cS + (cS - size.height) / 2
    }
    init() {
        
        let text = SKT(imageNamed: "tap")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        afterInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}