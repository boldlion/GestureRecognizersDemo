//
//  ViewController.swift
//  TapGestureRecognizerDemo
//
//  Created by Bold Lion on 17.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class TapGestureVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGesture()
    }
    
    func setTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped() {
        label.isHidden = !label.isHidden
    }
}

