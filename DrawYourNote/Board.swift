//
//  Board.swift
//  DrawYourNote
//
//  Created by Lydia Yu on 2016-11-04.
//  Copyright © 2016 Lydia Yu. All rights reserved.
//

import Foundation
import UIKit

class Board: UIView{
    var eraser : Bool = false
    var penColor = UIColor.red
    var lineWidth : CGFloat = 1.0
    var blend: CGBlendMode = CGBlendMode.normal
    private var bezier = UIBezierPath()
    private var allLine: [Dictionary<String, AnyObject>] = []
    private var cancelLine: [Dictionary<String, AnyObject>] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bezier = UIBezierPath()
        let point = touches.first!.location(in: self)
        bezier.move(to: point)
        var tmpDic = Dictionary<String, AnyObject>()
        tmpDic["color"] = penColor
        tmpDic["lineWidth"] = lineWidth as AnyObject?
        tmpDic["line"] = bezier
        tmpDic["blend"] = blend as AnyObject?
        allLine.append(tmpDic)
        
        
        //super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first!.location(in: self)
        bezier.addLine(to: point)
        setNeedsDisplay()
        //super.touchesMoved(touches, with: event)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //super.touchesEnded(touches, with: event)
    }
    
    override func draw(_ rect: CGRect){
        for i in 0 ..< allLine.count{
            let tmpDic = allLine[i]
            let tmpColor = tmpDic["color"] as! UIColor
            let tmpWidth = tmpDic["lineWidth"] as! CGFloat
            let tmpPath = tmpDic["line"] as! UIBezierPath
            let tmpBlend = tmpDic["blend"] as! CGBlendMode
            tmpColor.setStroke()
            tmpPath.lineWidth = tmpWidth
            tmpPath.stroke(with: tmpBlend, alpha: CGFloat(lineWidth))
        }
    }
    
    func penStyle(eraserEnable: Bool){
        if(eraserEnable){
            blend = CGBlendMode.clear
        }else{
            blend = CGBlendMode.normal
        }
    }
    func backImage() {
        if allLine.isEmpty == false {
            cancelLine.append(allLine.last!)
            allLine.removeLast()
            setNeedsDisplay()
        }
    }
    
    func forwardImage() {
        if cancelLine.isEmpty == false {
            allLine.append(cancelLine.last!)
            cancelLine.removeLast()
            setNeedsDisplay()
        }
    }
}
