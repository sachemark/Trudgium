//
//  GameField.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/11/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit



class Field {
   
    var cellSize : CGF
    var fieldX : Int
    var fieldY : Int
    var currPlayer = 0
    
    var walls : [[Wall]]
    var cells : [Cell]
    var buttons : [Button]
    var players : [Player]
    var wraps : [Cell]
    
    init(cS: CGF, fX: Int, fY: Int) {
        cellSize = cS
        fieldX = fX
        fieldY = fY
        walls = Array(count: fX * fY, repeatedValue: Array(count: fX * fY, repeatedValue: Wall()))
        cells = Array(count: fX * fY, repeatedValue: Cell())
        wraps = Array(count: fX * fY, repeatedValue: Cell())
        buttons = Array(count: 0, repeatedValue: Button())
        players = Array(count: 0, repeatedValue: Player())
    }
    
    func addPlayer(num: Int) {
        
        let pl = Player(currPos: num)
        pl.anchorPoint = CGP(x: 0, y: 0)
        pl.position = CGP(x: CGF(num % fieldX) * cellSize + 24, y: CGF(num / fieldX) * cellSize + 24)
        players.append(pl)
        AppDelegate.Scene!.addChild(pl)
    }
    func addButton(num: Int, door : pr) {
        
        let btn = Button(num: num, door: door)
        btn.position = CGP(x: CGF(num % 18 * 128 + 24), y: CGF(num / 18 * 128 + 24))
        addBarr(door.a, num2: door.b, type: 1)
        buttons.append(btn)
        AppDelegate.Scene!.addChild(btn)
    }
    func addCell(num: Int, type: Int) {
        
        let cl = Cell(num: num, type: type)
        cl.position = CGP(x: CGF(num % fieldX) * cellSize, y: CGF(num / fieldX) * cellSize)
        if type == 3 || type == 4 {
            cl.zPosition = -10
            wraps[num] = cl
        } else {
            cells[num] = cl
        }
        AppDelegate.Scene!.addChild(cl)
        
    }
    func addBarr(var num1: Int, var num2: Int, type: Int) {
        
        if (num1 > num2) {
            swap(&num1, &num2)
        }
        switch type {
        case 0:
            let br = Wall(cell1: num1, cell2: num2, fX: fieldX, cS: cellSize)
            walls[num1][num2] = br
            walls[num2][num1] = br
            AppDelegate.Scene!.addChild(br)
        case 1:
            let br = Door(cell1: num1, cell2: num2, fX: fieldX, cS: cellSize)
            walls[num1][num2] = br
            walls[num2][num1] = br
            AppDelegate.Scene!.addChild(br)
        default: break
        }

        
    }
    
    func checkInField(num: Int) -> Bool {
        return num > fieldX && num % fieldX != 0 && num % fieldX != (fieldX - 1) && num < fieldX * (fieldY - 1)
    }
    
    func cellIJ(a: Int, i: Int, j: Int) -> Int {
        return a + i + j * fieldX
    }
    func revealCells(pl: Player) {
        

    } // Creates Visible area
        
    
    
    
    func preSet() {
        for (var i = 0; i < fieldX * fieldY; ++i) {
            addCell(i, type: 3)
            if (i % fieldX == fieldX - 1 || i % fieldX == 0 || i / fieldX == 0 || i / fieldX == fieldY - 1) {
                addCell(i, type: 2)
            } else {
                addCell(i, type: 0)
            }
        }
    }
    
    
    func checkBounds(num: Int, dir: Int) -> Bool {
        
        var sec = (Int(dir < 2) * ((dir + 1) % 2 * 2 - 1))
        sec += (Int(dir > 1) * fieldX * ((dir - 1) % 2 * 2 - 1))
        
        if (walls[num][num+sec].exist ||
            (num % fieldX == (fieldX - 2) && dir == 0) || (num % fieldX == 1 && dir == 1) ||
            (num / fieldX == (fieldY - 2) && dir == 2) || (num / fieldX == 1 && dir == 3))
        {return false}
        return true
    }
    
    func checkRadius(rad: Int, inP: Int, outP: Int) -> Bool {
        return abs(inP % fieldX - outP % fieldX) <= rad &&
               abs(inP / fieldX - outP / fieldX) <= rad
    }
    
    func recGraph(inout nvis: [pr], inP: Int, rad: Int, way: Int, p: Int) {
        let mas = [1, -1, fieldX, -fieldX]
        
        
        for next in mas {
            var dr = true
            for i in buttons {
                if i.door.a == p && i.door.b == p + next && i.num == inP {
                    dr = false
                }
            }
            if (cells[p + next].type == 0) && (way + 1 < nvis[p + next].b) &&
               (!walls[p][p + next].exist) && checkRadius(rad, inP: inP, outP: p + next) &&
               dr {
                
                nvis[p + next] = pr(a: p, b: way)
                recGraph(&nvis, inP: inP, rad: rad, way: way + 1, p: p + next)
                
            }
        }
        
    }
    func getDir(rad: Int, inP: Int, outP: Int) -> [Int] {
        var nvis = Array(count: fieldX * fieldY, repeatedValue: pr(a: -1, b: 10000000))
        
        nvis[inP] = pr(a: inP, b: 0)
        
        if  checkRadius(rad, inP: inP, outP: outP) {

            recGraph(&nvis, inP: inP, rad: rad, way: 1, p: inP)
            
            if nvis[outP].a == -1 || nvis[outP].b == 10000000 {
                return [-1]
            } else {
                
                var res = Array(count: 0, repeatedValue: Int(0))
                res.append(outP)
                var cl = outP
                
                while nvis[cl].b != 0 {
                    res.append(nvis[cl].a)
                    cl = nvis[cl].a
                }
                res = res.reverse()
                for (var i = 0; i < res.count - 1; ++i) {
                    res[i] = direction(res[i], num2: res[i + 1], fieldX: fieldX)
                }
                res.popLast()
                return res
            }
            
        }
        return [-1]
        
    }
    

}


















