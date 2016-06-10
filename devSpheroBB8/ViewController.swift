//
//  ViewController.swift
//  devSpheroBB8
//
//  Created by Deiby Toralva Baldeón on 10/06/16.
//  Copyright © 2016 devAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let motionKit = MotionKit()
        
        motionKit.getAccelerometerValues { (x, y, z) in
            print("X: \(x)")
            print("Y: \(y)")
            print("Z: \(z)")
        }
        
    }

}

