//
//  SwipeGestureVC.swift
//  GestureRecognizersDemo
//
//  Created by Bold Lion on 19.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class SwipeGestureVC: UIViewController {

    @IBOutlet weak var labelDirection: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwipeGestures()
    }
    
    func setSwipeGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(swipe:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(swipe:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(swipe:)))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(swipe:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipe(swipe: UISwipeGestureRecognizer) {
        switch swipe.direction {
        case .up:
            labelDirection.text = "You swiped UP"
        case .down:
            labelDirection.text = "You swiped DOWN"
        case .left:
            labelDirection.text = "You swiped LEFT"
        case .right:
            labelDirection.text = "You swiped RIGHT"
        default:
            break
        }
    }
    
}
