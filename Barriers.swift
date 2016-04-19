//
//  Barriers.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/11/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class Wall : SKSN {
    
    var type : Int = -1
    var orient: Bool = true
    var cell1 = 299
    var cell2 = 300
    var exist = false
    
    var dl = CGP(x: 0, y: 0)
    var dr = CGP(x: 0, y: 0)
    var ul = CGP(x: 0, y: 0)
    var ur = CGP(x: 0, y: 0)
    
    
    func afterInit(fX: Int, cS: CGF) {
        zPosition = 2
        anchorPoint = CGP(x: 0, y: 0)
        position = CGP(x: CGF(cell2 % fX) * cS - 10, y: CGF(cell2 / fX) * cS - 10)
    }
    init() {
        let text = SKT(imageNamed: "empty")
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
    }
    init(cell1 : Int, cell2 : Int, fX: Int, cS: CGF) {
        
        let sc = AppDelegate.Scene!
        
        self.cell1 = cell1
        self.cell2 = cell2
        self.exist = true
        
        if (cell1 / fX == cell2 / fX) {
            let text = SKT(imageNamed: "vert-wall")
            
            dl = CGP(x: CGF(max(cell1, cell2) % sc.fieldX) * sc.cellSize - 10, y: CGF(cell1 / sc.fieldX) * sc.cellSize - 10)
            dr = CGP(x: CGF(max(cell1, cell2) % sc.fieldX) * sc.cellSize + 10, y: CGF(cell1 / sc.fieldX) * sc.cellSize - 10)
            ul = CGP(x: CGF(max(cell1, cell2) % sc.fieldX) * sc.cellSize - 10, y: CGF(cell1 / sc.fieldX + 1) * sc.cellSize + 10)
            ur = CGP(x: CGF(max(cell1, cell2) % sc.fieldX) * sc.cellSize + 10, y: CGF(cell1 / sc.fieldX + 1) * sc.cellSize + 10)
            
            super.init(texture: text, color: UIC.clearColor(), size: text.size())
        } else {
            
            dl = CGP(x: CGF(cell1 % sc.fieldX) * sc.cellSize - 10, y: CGF(max(cell1, cell2) / sc.fieldX) * sc.cellSize - 10)
            dr = CGP(x: CGF(cell1 % sc.fieldX + 1) * sc.cellSize + 10, y: CGF(max(cell1, cell2) / sc.fieldX) * sc.cellSize - 10)
            ul = CGP(x: CGF(cell1 % sc.fieldX) * sc.cellSize - 10, y: CGF(max(cell1, cell2) / sc.fieldX ) * sc.cellSize + 10)
            ur = CGP(x: CGF(cell1 % sc.fieldX + 1) * sc.cellSize + 10, y: CGF(cell1 / sc.fieldX ) * sc.cellSize + 10)
            
            orient = false
            let text = SKT(imageNamed: "hor-wall")
            super.init(texture: text, color: UIC.clearColor(), size: text.size())
        }
        
        afterInit(fX, cS: cS)
        
    }
    init(cell1 : Int, cell2 : Int, img : String, fX: Int, cS: CGF) {
        
        self.cell1 = cell1
        self.cell2 = cell2
        self.exist = true
        
        let text = SKT(imageNamed: img)
        super.init(texture: text, color: UIC.clearColor(), size: text.size())
        if (cell1 / 18 != cell2 / 18) {
           orient = false
        }
        
        afterInit(fX, cS: cS)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Door : Wall {
    
    var opened : Bool = true
//     var oCell = 0 // num of opening cell
    
    override init(cell1 : Int, cell2 : Int, fX: Int, cS: CGF) {
        
        let img : String
        if (cell1 / fX == cell2 / fX) {
            img = "vert-door"
        } else {
            img = "hor-door"
        }
        super.init(cell1: cell1, cell2: cell2, img: img, fX: fX, cS: cS)
        type = 1
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}










