//
//  GameViewController.swift
//  Trudgium
//
//  Created by Mark Yankovsky on 3/6/16.
//  Copyright (c) 2016 ridge_works. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrWidth = UIScreen.mainScreen().bounds.width * CGF(2)
        scrHeight = UIScreen.mainScreen().bounds.height * CGF(2)
        
        print(CGSize(width: scrWidth, height: scrHeight))
        
        let scene = GameScene(fX: 18, fY: 14, cS: 128, sP: CGP(x: 152, y: 152), sz: CGSize(width: scrWidth, height: scrHeight))
        let skView = self.view as! SKView
        
        
        print(skView.frame.origin)
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        print(skView.frame.maxX)
        
        
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
    
    
  
}
