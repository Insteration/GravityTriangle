//
//  ViewController.swift
//  GravityTriangle
//
//  Created by Art Karma on 4/30/19.
//  Copyright © 2019 Art Karma. All rights reserved.
//

import UIKit
import CoreMotion

class GravityTriangleViewController: UIViewController, TriangleProtocol {
    
    private var motionManager = CMMotionManager()
    private var timer: Timer!
    
    var triangle = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let line1 = Line(dataLine: .init(lineNumber: .sideOne, lineLength: 50))
//        view.addSubview(line1)
//        let line2 = Line(dataLine: .init(lineNumber: .sideTwo, lineLength: 50))
//        view.addSubview(line2)
//        let line3 = Line(dataLine: .init(lineNumber: .sideThree, lineLength: 50))
//        view.addSubview(line3)
        
//        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
//        myView.backgroundColor = .lightGray
//        view.addSubview(myView)
        
        triangle = TriangleView(triangleData: TriangleData(x: 150, y: 150, length: 60, width: 3))
        view.addSubview(triangle)
        
        
//        let myView = buildTriangle(triangleData: TriangleData(x: 100, y: 100, length: 150, width: 5))
//        view.addSubview(myView)
        
        createTimer()
    }
    
    fileprivate func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(startGyroscoper), userInfo: nil, repeats: true)
    }
    
    @objc func startGyroscoper() {
        
        if motionManager.isAccelerometerAvailable {
            motionManager.gyroUpdateInterval = 0.05
            
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                guard let data = data, error == nil else { return }
                
                self.triangle.center.x += CGFloat(data.acceleration.x)
                self.triangle.center.y += CGFloat(data.acceleration.y)
            }
        }
    }
}

