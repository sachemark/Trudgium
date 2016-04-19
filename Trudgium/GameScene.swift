//
//  GameScene.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/6/16.
//  Copyright (c) 2016 ridge_works. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    
    let cameraNode = SKCameraNode()
    var field : Field
    
    var cellSize : CGF
    var fieldX : Int
    var fieldY : Int
    var startPoint : CGP
    var startCell : Int
    var ws = [pr(a: 7, b: 25), pr(a: 8, b: 26), pr(a: 9, b: 27), pr(a: 24, b: 25), pr(a: 27, b: 28), pr(a: 42, b: 43), pr(a: 43, b: 44), pr(a: 44, b: 45), pr(a: 45, b: 46), pr(a: 46, b: 47), pr(a: 47, b: 29), pr(a: 48, b: 30), pr(a: 58, b: 59), pr(a: 59, b: 41), pr(a: 59, b: 60), pr(a: 60, b: 61), pr(a: 61, b: 62), pr(a: 62, b: 63), pr(a: 64, b: 46), pr(a: 67, b: 49), pr(a: 68, b: 50), pr(a: 77, b: 59), pr(a: 78, b: 60), pr(a: 78, b: 79), pr(a: 80, b: 62), pr(a: 81, b: 63), pr(a: 82, b: 64), pr(a: 83, b: 65), pr(a: 84, b: 66), pr(a: 85, b: 67), pr(a: 85, b: 86), pr(a: 86, b: 87), pr(a: 95, b: 77), pr(a: 95, b: 96), pr(a: 97, b: 79), pr(a: 98, b: 99), pr(a: 102, b: 103), pr(a: 103, b: 85), pr(a: 104, b: 105), pr(a: 114, b: 96), pr(a: 114, b: 115), pr(a: 115, b: 97), pr(a: 117, b: 99), pr(a: 117, b: 118), pr(a: 118, b: 119), pr(a: 119, b: 101), pr(a: 120, b: 102), pr(a: 121, b: 122), pr(a: 122, b: 104), pr(a: 128, b: 129), pr(a: 129, b: 111), pr(a: 130, b: 112), pr(a: 131, b: 113), pr(a: 131, b: 132), pr(a: 132, b: 133), pr(a: 134, b: 116), pr(a: 135, b: 136), pr(a: 136, b: 137), pr(a: 137, b: 138), pr(a: 138, b: 120), pr(a: 139, b: 121), pr(a: 147, b: 129), pr(a: 148, b: 130), pr(a: 148, b: 149), pr(a: 149, b: 150), pr(a: 151, b: 133), pr(a: 151, b: 152), pr(a: 152, b: 153), pr(a: 153, b: 135), pr(a: 154, b: 155), pr(a: 156, b: 138), pr(a: 157, b: 139), pr(a: 166, b: 167), pr(a: 167, b: 168), pr(a: 169, b: 170), pr(a: 170, b: 171), pr(a: 173, b: 155), pr(a: 173, b: 174), pr(a: 174, b: 175), pr(a: 175, b: 157), pr(a: 184, b: 185), pr(a: 185, b: 186), pr(a: 186, b: 187), pr(a: 187, b: 169), pr(a: 189, b: 171), pr(a: 191, b: 192), pr(a: 192, b: 193), pr(a:202 , b: 203), pr(a: 203, b: 204), pr(a: 204, b: 205), pr(a: 205, b: 206), pr(a: 206, b: 188), pr(a: 206, b: 207), pr(a: 207, b: 208), pr(a: 208, b: 209), pr(a: 209, b: 191), pr(a: 209, b: 210), pr(a: 210, b: 211), pr(a: 220, b: 221), pr(a: 222, b: 204), pr(a: 223, b: 224), pr(a: 227, b: 209), pr(a: 228, b: 210)]
    
    init(fX: Int, fY: Int, cS: CGF, sP : CGP, sz: CGSize) {
        fieldX = fX
        fieldY = fY
        cellSize = cS
        startPoint = sP
        startCell = Int(startPoint.y / cellSize) * fieldX + Int(startPoint.x / cellSize)
        field = Field(cS: cS, fX: fX, fY: fY)

        super.init(size: sz)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
    func movePlayer(inout dirs : [Int], inout sprite: Player, t: [Tap]) {
    
        if dirs[0] != -1 {
            
        var sec = (Int(dirs[0] < 2) * ((dirs[0] + 1) % 2 * 2 - 1))
        sec += (Int(dirs[0] > 1) * fieldX * ((dirs[0] - 1) % 2 * 2 - 1))
        
        var finished = false
        
        if field.cells[sprite.currPos + sec].isK  {
            sprite.prevPos = sprite.currPos
            sprite.currPos = startCell
            sprite.position = startPoint
        } else {
            if (field.checkBounds(sprite.currPos, dir: dirs[0]) ) {
                let x = CGF(Int(dirs[0] < 2)) * CGF((dirs[0] + 1) % 2 * 2 - 1) * cellSize
                let y = CGF(Int(dirs[0] > 1)) * CGF((dirs[0] - 1) % 2 * 2 - 1) * cellSize
                
                sprite.runAction(SKAction.sequence([SKAction.runBlock({
                    self.switchRecognizers()
                }), SKAction.moveTo(CGP(x: sprite.position.x + x, y: sprite.position.y + y), duration: NSTimeInterval(sprite.spd)), SKAction.runBlock({
                    () -> Void in
                    sprite.prevPos = sprite.currPos
                    sprite.currPos += (Int(dirs[0] < 2) * ((dirs[0] + 1) % 2 * 2 - 1))
                    sprite.currPos += (Int(dirs[0] > 1) * self.fieldX * ((dirs[0] - 1) % 2 * 2 - 1))
                    self.switchRecognizers()
                    finished = true
                }), SKAction.runBlock({
                    if (dirs.count > 1) {
                        dirs.removeFirst()
                        self.movePlayer(&dirs, sprite: &sprite, t: t)
                    } else {
                        if t.count > 0 {
                            t[0].removeFromParent()
                        }
                    }
                    
                })]))
            }
            
        }
            
        }
    }
    
    func switchRecognizers() {
        for recognizer in (view?.gestureRecognizers)! {
            recognizer.enabled = !recognizer.enabled
        }
    }
  
    func checkKillCell() -> Bool {
        field.players[field.currPlayer].position = startPoint
        field.players[field.currPlayer].currPos = startCell
        return false
    }
    
    
    func swipedRight(sender: UISwipeGestureRecognizer) {
        var m = [0]
        movePlayer(&m, sprite: &field.players[field.currPlayer], t: [])
    }
    func swipedLeft(sender: UISwipeGestureRecognizer) {
        var m = [1]
        movePlayer(&m, sprite: &field.players[field.currPlayer], t: [])
    }
    func swipedUp(sender: UISwipeGestureRecognizer) {
        var m = [2]
        movePlayer(&m, sprite: &field.players[field.currPlayer], t: [])
    }
    func swipedDown(sender: UISwipeGestureRecognizer) {
        var m = [3]
        movePlayer(&m, sprite: &field.players[field.currPlayer], t: [])
    }
    func Touched(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {
            
            
            var touch = sender.locationInView(sender.view)
            touch = self.convertPointFromView(touch)
            
            if abs(touch.x - field.players[field.currPlayer].position.x) < cellSize * 3.9 &&
                abs(touch.y - field.players[field.currPlayer].position.y) < cellSize * 3.9 {
                    
                var tp = Tap()
                tp.position = touch
                tp.equal(cellSize)
                let tNum = tp.getNum(cellSize, fieldX: fieldX)
                
                let cType = field.cells[tNum].type
                    
                if (cType == 0 && field.players[field.currPlayer].currPos != tNum
                    && tNum != field.players[abs(field.players.count - 1 - field.currPlayer)].currPos) {
                    var mov = field.getDir(field.players[field.currPlayer].rad, inP: field.players[field.currPlayer].currPos, outP: tNum)
                    if mov[0] != -1 {
                        addChild(tp)
                    }
                    self.movePlayer(&mov, sprite: &self.field.players[self.field.currPlayer], t : [tp])
                } else {
                    if tNum == field.players[abs(field.players.count - 1 - field.currPlayer)].currPos {
                        field.currPlayer = abs(field.players.count - 1 - field.currPlayer)
                    }
                }
                    
            }
            
            
        }
    }
    
    func remTP(inout tp: Tap) {
        tp.removeFromParent()
    }
    func cameraCheck() {
        if (cameraNode.position.x < frame.width / 2) {
            cameraNode.position.x = frame.width / 2
        }
        if (cameraNode.position.y < frame.height / 2) {
            cameraNode.position.y = frame.height / 2
        }
        if (cameraNode.position.x > CGF(fieldX) * cellSize - frame.width / 2) {
            cameraNode.position.x = CGF(fieldX) * cellSize - frame.width / 2
        }
        if (cameraNode.position.y > CGF(fieldY) * cellSize - frame.height / 2) {
            cameraNode.position.y = CGF(fieldY) * 128 - frame.height / 2
        }
    }
    
    override func didMoveToView(view: SKView) {
        
        do {
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
        
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
            
        let Touch = UITapGestureRecognizer(target:self, action: Selector("Touched:"))
        view.addGestureRecognizer(Touch)
            
        } // SWIPES AND TOUCHES SETTING
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        backgroundColor = SKC.blackColor()
        self.anchorPoint = CGP(x: 0, y: 0)
        AppDelegate.Scene = self // presetting
        
        for i in ws {
            field.addBarr(i.a, num2: i.b, type: 0)
        }
        field.preSet()
        field.addBarr(19, num2: 20, type: 0)
        field.addButton(37, door: pr(a: 39, b: 40))
        field.addCell(45, type: 1)
        field.addPlayer(19)
        field.addPlayer(55)
        field.currPlayer = 0
        
        field.players[field.currPlayer].active = true
        
        print(field.walls[7][25].dl.x, field.walls[7][25].dl.y)
        print(field.walls[7][25].dr.x, field.walls[7][25].dr.y)
        print(field.walls[7][25].ul.x, field.walls[7][25].ul.y)
        print(field.walls[7][25].ur.x, field.walls[7][25].ur.y)
    }

    override func update(currentTime: NSTimeInterval) {
        for j in field.buttons {
            var tru = true
            for i in field.players {
                if j.num == i.currPos {
                    tru = false
                    field.walls[j.door.a][j.door.b].zPosition = -2
                    field.walls[j.door.b][j.door.a].zPosition = -2
                    field.walls[j.door.b][j.door.a].exist = false
                    field.walls[j.door.a][j.door.b].exist = false
                    
                }
            }
            if tru {
                field.walls[j.door.a][j.door.b].zPosition = 1
                field.walls[j.door.b][j.door.a].zPosition = 1
                field.walls[j.door.b][j.door.a].exist = true
                field.walls[j.door.a][j.door.b].exist = true
            }
//            field.revealCells(field.players[field.currPlayer])
        }
        

        
        cameraNode.position = field.players[field.currPlayer].position
        cameraCheck()
        
    }
    


    
    
    
}



























