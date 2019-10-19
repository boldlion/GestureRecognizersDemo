//
//  UILongPressGestureVC.swift
//  GestureRecognizersDemo
//
//  Created by Bold Lion on 19.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class LongPressGestureVC: UIViewController {

    var colors: [UIColor] = [.red, .blue, .brown, .cyan, .white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLongPressGesture()
    }
    
    func setLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1
        view.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            if let randomColor = colors.randomElement() {
                view.backgroundColor = randomColor
            }
        }
    }
    
}
