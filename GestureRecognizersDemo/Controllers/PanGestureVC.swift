//
//  PanGestureVC.swift
//  GestureRecognizersDemo
//
//  Created by Bold Lion on 19.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class PanGestureVC: UIViewController {

    @IBOutlet weak var folderImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var folderViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPanGesture()
        folderViewOrigin = folderImageView.frame.origin
    }
    
    func setPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(pan:)))
        folderImageView.addGestureRecognizer(panGesture)
        folderImageView.isUserInteractionEnabled = true
    }
    
    @objc func handlePanGesture(pan: UIPanGestureRecognizer) {
        
        guard let folderView = pan.view else { return }
        
        switch pan.state {
        case .began, .changed:
            moveViewWithPan(view: folderView, sender: pan)
        case .ended:
            if folderView.frame.intersects(trashImageView.frame) {
                deleteView(viewToDelete: folderView)
            }
            else {
                returnViewToOrigin(viewToMove: folderView)
            }
        default:
            break
        }
        
    }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        // Get the amount that the user has moved their finger by calling translation(in:)
        let translation = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + translation.x,
                              y: view.center.y + translation.y)
        // Important: Set the translation back to zero, otherwise the translation will keep compounding each time and it will go off the screen
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func returnViewToOrigin(viewToMove: UIView) {
        guard let folderStartingPoing = folderViewOrigin else { return }
        UIView.animate(withDuration: 0.3, animations: {
            viewToMove.frame.origin = folderStartingPoing
        })
    }
    
    func deleteView(viewToDelete: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            viewToDelete.alpha = 0.0
        })
    }

}
