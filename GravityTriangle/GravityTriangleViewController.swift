//
//  ViewController.swift
//  GravityTriangle
//
//  Created by Art Karma on 4/30/19.
//  Copyright © 2019 Art Karma. All rights reserved.
//

import UIKit

class GravityTriangleViewController: UIViewController {
    
    
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
        
        let triangle = TriangleView(triangleData: TriangleData(x: 100, y: 100, length: 150, width: 5))
        view.addSubview(triangle)
        
    }
    
    
}

