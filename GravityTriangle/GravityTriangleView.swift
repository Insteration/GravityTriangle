//
//  GravityTriangleView.swift
//  GravityTriangle
//
//  Created by Art Karma on 4/30/19.
//  Copyright © 2019 Art Karma. All rights reserved.
//

import UIKit

struct TriangleData {
    var x: Int
    var y: Int
    var length: Int
    var width = 2

    init(x: Int, y: Int, length: Int) {
        self.x = x
        self.y = y
        self.length = length
    }
    
    init(x: Int, y: Int, length: Int, width: Int) {
        self.x = x
        self.y = y
        self.length = length
        self.width = width
    }
}

class TriangleView: UIView {
    var x: Int!
    var y: Int!
    var length: Int!
    var width: Int!
    
    init(triangleData: TriangleData) {
        self.x = triangleData.x
        self.y = triangleData.y
        self.length = triangleData.length
        self.width = triangleData.width
        
        let height = Int(sqrt(3.0) * Double(self.length) / 3.5)
        
        let line1 = Line(dataLine: DataLine(lineNumber: .sideOne, lineLength: self.length, lineWidth: self.width))
        
        let line2 = Line(dataLine: DataLine(lineNumber: .sideTwo, lineLength: self.length, lineWidth: self.width))
        let viewLine2 = UIView(frame: CGRect(x: self.length, y: -height * 2, width: self.length / 2, height: height))
        viewLine2.addSubview(line2)
        
        let line3 = Line(dataLine: DataLine(lineNumber: .sideThree, lineLength: self.length * 2, lineWidth: self.width))
        let viewLine3 = UIView(frame: CGRect(x: Int(line1.frame.origin.x), y: self.length, width: self.length, height: height))
        viewLine3.addSubview(line3)

        
        
        super.init(frame: CGRect(x: self.x, y: self.y, width: self.length * 2, height: height * 2 + self.width * 2))
        self.addSubview(line1)
        self.addSubview(viewLine2)
        self.addSubview(viewLine3)
        self.backgroundColor = .yellow
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol TriangleProtocol {
    func buildTriangle(triangleData: TriangleData) -> UIView
}

extension TriangleProtocol {
    func buildTriangle(triangleData: TriangleData) -> UIView {
        
        let mainView = UIView()
        
        let height = Int(sqrt(3.0) * Double(triangleData.length) / 3.5)

        
        let line1 = Line(dataLine: DataLine(lineNumber: .sideOne, lineLength: triangleData.length, lineWidth: triangleData.width))
        
        let line2 = Line(dataLine: DataLine(lineNumber: .sideTwo, lineLength: triangleData.length, lineWidth: triangleData.width))
        let viewLine2 = UIView(frame: CGRect(x: triangleData.length, y: -height * 2, width: triangleData.length / 2, height: height))
        viewLine2.addSubview(line2)
        
        let line3 = Line(dataLine: DataLine(lineNumber: .sideThree, lineLength: triangleData.length * 2, lineWidth: triangleData.width))
        let viewLine3 = UIView(frame: CGRect(x: Int(line1.frame.origin.x), y: triangleData.length, width: triangleData.length, height: height))
        viewLine3.addSubview(line3)
        
        mainView.addSubview(line1)
        mainView.addSubview(viewLine2)
        mainView.addSubview(viewLine3)
        
        return mainView
        
    }
}
