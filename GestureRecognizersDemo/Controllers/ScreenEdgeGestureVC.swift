//
//  ScreenEdgeGestureVC.swift
//  GestureRecognizersDemo
//
//  Created by Bold Lion on 19.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class ScreenEdgeGestureVC: UIViewController {

    @IBOutlet weak var arrowImageView: UIImageView!
    var currentRadius: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreenEdgeGesture()
    }
    
    func setScreenEdgeGesture() {
        let screenEdgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenEdgeGesture(gesture:)))
        screenEdgeGesture.edges = .right
        view.addGestureRecognizer(screenEdgeGesture)
    }
    
    @objc func handleScreenEdgeGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .ended {
            if currentRadius == 360.00 {
                currentRadius = 0.0
            }
            UIView.animate(withDuration: 0.3) { [unowned self] in
                       self.currentRadius += 90.0
                       self.arrowImageView.transform = CGAffineTransform(rotationAngle: self.currentRadius * .pi / 180.0)
            }
        }
    }
}
