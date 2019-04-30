//
//  GravityTriangleLineView.swift
//  GravityTriangle
//
//  Created by Art Karma on 4/30/19.
//  Copyright © 2019 Art Karma. All rights reserved.
//

import UIKit

enum LineSide {
    case sideOne, sideTwo, sideThree
}

struct DataLine {
    var lineNumber: LineSide
    var lineLength: Int
    var lineWidth = 2
    
    init(lineNumber: LineSide, lineLength: Int) {
        self.lineNumber = lineNumber
        self.lineLength = lineLength
    }
    
    init(lineNumber: LineSide, lineLength: Int, lineWidth: Int) {
        self.lineNumber = lineNumber
        self.lineLength = lineLength
        self.lineWidth = lineWidth
    }
}

class Line: UIView {
    var lineNumber: LineSide!
    var lineLength: Int!
    var lineWidth: Int!
    
    init(dataLine: DataLine) {
        super.init(frame: CGRect())
        
        self.lineNumber = dataLine.lineNumber
        self.lineLength = dataLine.lineLength
        self.lineWidth = dataLine.lineWidth
        
        var arrView = [UIView]()
        
        switch self.lineNumber {
        case .sideOne?:
            for i in 0..<self.lineLength {
                let pointFrame = CGRect(x: i, y: self.lineLength - i, width: self.lineWidth, height: self.lineWidth)
                let myView = UIView(frame: pointFrame)
                myView.backgroundColor = .red
                arrView.append(myView)
            }
        case .sideTwo?:
            for i in 0..<self.lineLength {
//                let pointFrame = CGRect(x: self.lineLength + i, y: i, width: self.lineWidth, height: self.lineWidth)
                let pointFrame = CGRect(x: i, y: self.lineLength + i, width: self.lineWidth, height: self.lineWidth)
                let myView = UIView(frame: pointFrame)
                myView.backgroundColor = .green
                arrView.append(myView)
            }
        case .sideThree?:
            let lineFrame = CGRect(x: 0, y: 0, width: self.lineLength, height: self.lineWidth)
            let myView = UIView(frame: lineFrame)
            myView.backgroundColor = .blue
            arrView.append(myView)
        case .none:
            ()
        }
        
        arrView.forEach{
            self.addSubview($0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
