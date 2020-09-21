//
//  ViewController.swift
//  StopWatch
//
//  Created by Shinya  on 2020/09/06.
//  Copyright © 2020 Shinya . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerLabel : UILabel!
    @IBOutlet var hanteiLabel : UILabel!
    
    var count : Float = 0.00
    var timer : Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func up() {
        count = count + 0.01
        timerLabel.text = String(format: "%.2f", count)
    }
    
    @objc func hantei() {
        if count >= 4.80, count <= 5.20 {
            hanteiLabel.text = String("PERFECT!")
            hanteiLabel.textColor = UIColor.red
        }else if count >= 4.70, count <= 5.30 {
            hanteiLabel.text = String("GREAT!")
            hanteiLabel.textColor = UIColor.orange
        }else if count >= 4.50, count <= 5.50 {
            hanteiLabel.text = String("GOOD")
            hanteiLabel.textColor = UIColor.yellow
        }else {
            hanteiLabel.text = String("BAD")
            hanteiLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func start(){        
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer (timeInterval: 0.01,
                                          target: self,
                                          selector: #selector(self.up),
                                          userInfo: nil,
                                          repeats: true)
        }
    }
    
    @IBAction func stop(){
        if timer.isValid {
            //タイマーが動いていたら停止する
            timer.invalidate()
            self.hantei()
        }
        
    }
    
    @IBAction func reset() {
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.00
        timerLabel.text = String(format: "%.2f" , count)
    }

}

