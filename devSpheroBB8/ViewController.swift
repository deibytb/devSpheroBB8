//
//  ViewController.swift
//  devSpheroBB8
//
//  Created by Deiby Toralva Baldeón on 10/06/16.
//  Copyright © 2016 devAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var xInput: UITextField!
    @IBOutlet weak var yInput: UITextField!
    @IBOutlet weak var zInput: UITextField!
    
    var robot: RKConvenienceRobot!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let motionKit = MotionKit()
        
        motionKit.getAccelerometerValues { (x, y, z) in
            dispatch_async(dispatch_get_main_queue(), {
                self.xInput.text = String(x)
                self.yInput.text = String(y)
                self.zInput.text = String(z)
            })
        }
                
        RKRobotDiscoveryAgent.sharedAgent().addNotificationObserver(self, selector: #selector(ViewController.handleRobotStateChangeNotification(_:)))
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.appDidBecomeActive(_:)), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
    }
    
    func handleRobotStateChangeNotification(notification: RKRobotChangedStateNotification) {
        switch (notification.type) {
        case .Online:
            print("Online")
            robot = RKConvenienceRobot(robot: notification.robot)
            break
        case .Disconnected:
            print("Disconnected")
            break
        case .FailedConnect:
            print("FailConnect")
            break
        default:
            print("Default case detect Sphero")
        }
    }
    
    
    func appDidBecomeActive(n: NSNotification) {
        RKRobotDiscoveryAgent.startDiscovery()
    }

    func disconnectRobot() {
        if (robot.isKindOfClass(RKRobotLE)) {
            robot.sleep()
        } else if (robot.isKindOfClass(RKRobotClassic)) {
            robot.disconnect()
        }
    }
    
    @IBAction func discoverButton(sender: AnyObject) {
        robot.sleep()
    }
    
    
    @IBAction func runButton(sender: AnyObject) {
        robot.sendCommand(RKRollCommand(heading: 0, velocity: 1.0))

    }
    
    
}

