//
//  SelectDemoVC.swift
//  TapGestureRecognizerDemo
//
//  Created by Bold Lion on 17.10.19.
//  Copyright © 2019 Bold Lion. All rights reserved.
//

import UIKit

class SelectDemoVC: UIViewController {
    
    @IBAction func tapGestureTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "TapGestureVC") as! TapGestureVC
        navigationController?.pushViewController(vc, animated: true)
    }
     
    @IBAction func pinchGestureTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "PinchGestureVC") as! PinchGestureVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
