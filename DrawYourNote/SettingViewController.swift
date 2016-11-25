//
//  SettingViewController.swift
//  DrawYourNote
//
//  Created by Lydia Yu on 2016-11-04.
//  Copyright © 2016 Lydia Yu. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate: class {
    func settingViewControllerFinished(_ settingViewController: SettingViewController)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var brushWidth: UISlider!
    @IBOutlet weak var brushRed: UISlider!
    @IBOutlet weak var brushGreen: UISlider!
    @IBOutlet weak var brushBlue: UISlider!
    @IBOutlet weak var bgRed: UISlider!
    @IBOutlet weak var bgGreen: UISlider!
    @IBOutlet weak var bgBlue: UISlider!
    var currentValue: Float = 1.0
    var brushColor: UIColor = UIColor.black
    var bgColor: UIColor = UIColor.white
    var br: CGFloat = 0
    var bg: CGFloat = 0
    var bB: CGFloat = 0
    
    var bgR: CGFloat = 0
    var bgG: CGFloat = 0
    var bgB: CGFloat = 0
    
    weak var delegate: SettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brushWidth.setValue(currentValue, animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeBrushWidth(_ sender: AnyObject) {
        currentValue = Float(brushWidth.value)
        
        label.text = "\(currentValue)"
    }
    @IBAction func bsRed(_ sender: AnyObject) {
        br = CGFloat(brushRed.value)
        getBrushColor()
        drawPreview2()
    }
    @IBAction func bsGreen(_ sender: AnyObject) {
        bg = CGFloat(brushGreen.value)
        getBrushColor()
        drawPreview2()
    }
    @IBAction func bsBlue(_ sender: AnyObject) {
        bB = CGFloat(brushBlue.value)
        getBrushColor()
        drawPreview2()
    }
    
    @IBAction func bgRed(_ sender: AnyObject) {
        bgR = CGFloat(bgRed.value)
        getBGColor()
        drawPreview3()
    }
    
    @IBAction func bgGreen(_ sender: AnyObject) {
        bgG = CGFloat(bgGreen.value)
        getBGColor()
        drawPreview3()
    }
    
    @IBAction func bgBlue(_ sender: AnyObject) {
        bgB = CGFloat(bgBlue.value)
        getBGColor()
        drawPreview3()
    }
  
    func drawPreview2(){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 60,y: 300), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = brushColor.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = brushColor.cgColor
        //you can change the line width
        shapeLayer.lineWidth = CGFloat(40)
        
        view.layer.addSublayer(shapeLayer)
    }
    func drawPreview3(){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 60,y: 500), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circlePath.cgPath
        //change the fill color
        shapeLayer.fillColor = bgColor.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = bgColor.cgColor
        //you can change the line width
        shapeLayer.lineWidth = CGFloat(40)
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func getBrushColor(){
        brushColor = UIColor(red: br/255, green: bg/255, blue: bB/255, alpha: 1)
    }
    func getBGColor(){
        bgColor = UIColor(red: bgR/255, green: bgG/255, blue: bgB/255, alpha: 1)
    }
    
    @IBAction func save(_ sender: AnyObject) {
        self.delegate?.settingViewControllerFinished(self)
    }
    
}
