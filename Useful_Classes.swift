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

