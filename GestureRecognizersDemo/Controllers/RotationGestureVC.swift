//
//  RotationGestureVC.swift
//  GestureRecognizersDemo
//
//  Created by Bold Lion on 18.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class RotationGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setRotationGestion()
    }
    
    func setRotationGestion() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(sender:)))
        view.addGestureRecognizer(rotationGesture)
    }
    
    @objc func handleRotation(sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}
