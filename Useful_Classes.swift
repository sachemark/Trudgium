//
//  Useful_Classes.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/6/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Foundation
import SpriteKit

class pr {
    
    var a, b : Int
    init() {
        a = 0
        b = 0
    }
    init(a : Int, b : Int) {
        self.a = a
        self.b = b
    }
}



class line {
    var a = CGF(0.0)
    var b = CGF(0.0)
    var c = CGF(0.0)
    
    init(p1: CGP, p2: CGP) {
        a = p1.y - p2.y
        b = p2.x - p1.x
        c = p1.x * p2.y - p2.x * p1.y
    }
}
class segment {
    var a = CGP(x: 0, y: 0)
    var b = CGP(x: 0, y: 0)
    var length = CGF(0)
    init(a: CGP, b: CGP) {
        self.a = a
        self.b = b
        length = dist(a, b: b)
    }
    func inside(p: CGP) -> Bool {
        return abs(dist(a, b: p) + dist(b, b: p) - length) < CGF(0.0001)
    }
}