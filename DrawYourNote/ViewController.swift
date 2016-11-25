//
//  ViewController.swift
//  DrawYourNote
//
//  Created by Lydia Yu on 2016-11-04.
//  Copyright © 2016 Lydia Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    let screenSize: CGRect = UIScreen.main.bounds
    var penColor1: UIColor = UIColor.black
    var brushWidth: Float = 0.0
    //var brushColor: UIColor = UIColor.black
    var backgroundColor: UIColor = UIColor.white

    @IBOutlet weak var redo: UIButton!
    @IBOutlet weak var setting: UIButton!
//    @IBOutlet weak var pen: UIButton!
    @IBOutlet weak var eraser: UIButton!
    private let board = Board()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        board.frame = CGRect(x:0, y:0, width: screenSize.width, height: screenSize.height)
        view.addSubview(board)
//        board.addSubview(pen)
        board.addSubview(eraser)
        board.addSubview(setting)
        board.addSubview(redo)
        
        //change button images
//        pen.setImage(UIImage(named:"pen.png"), for: .normal)
        eraser.setImage(UIImage(named:"undo.png"), for: .normal)
        redo.setImage(UIImage(named:"redo.png"), for: .normal)
        setting.setImage(UIImage(named:"setting.png"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //@IBAction func choosePen(_ sender: AnyObject) {
    //    board.penStyle(eraserEnable: false)
    //}
    
    @IBAction func chooseEraser(_ sender: AnyObject) {
        board.backImage()
    }
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveSettings(segue:UIStoryboardSegue) {
        if let vc = segue.source as? SettingViewController{
            penColor1 = vc.brushColor
            backgroundColor = vc.bgColor
            brushWidth = vc.currentValue
        }
        changecolor()
    }
    @IBAction func redo(_ sender: AnyObject) {
        board.forwardImage()
    }
    func changecolor(){
        board.backgroundColor = backgroundColor
        board.penColor = penColor1
        board.lineWidth = CGFloat(brushWidth)
    }
}



