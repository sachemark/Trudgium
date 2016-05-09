//
//  Useful_funcs.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/6/16.
//  Copyright © 2016 ridge_works. All rights reserved.
//

import Darwin
import Foundation
import SpriteKit

func direction(num1: Int, num2: Int, fieldX: Int) -> Int {
    
    var a = num1 - num2
    if (num1 == num2) {
        return -1
    }
    return Int(a > 0) + 2 * Int(abs(a) >= fieldX)
    
}

func l_isect(lin1 : line, lin2 : line) -> CGP {
    let x = (lin2.b * lin1.c - lin2.c * lin1.b) / (lin2.a * lin1.b - lin2.b * lin1.a)
    let y = (lin2.a * lin1.c - lin2.c * lin1.a) / (lin2.b * lin1.a - lin2.a * lin1.b)
    return CGP(x: x, y: y)
} // intersection of 2 lines

func dist(a: CGP, b: CGP) -> CGF {
    return sqrt(pow(abs(a.x - b.x), 2) + pow(abs(a.y - b.y), 2))
}



























