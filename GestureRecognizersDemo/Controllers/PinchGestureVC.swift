//
//  TapGestureStoryboardVC.swift
//  TapGestureRecognizerDemo
//
//  Created by Bold Lion on 17.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class PinchGestureVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setPinchGesture()
    }
    
    func setPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(pinch)
    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        }
    }
}
