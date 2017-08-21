//
//  ViewController.swift
//  SJRingViewKitSwift
//
//  Created by SoulJaZhao on 08/21/2017.
//  Copyright (c) 2017 SoulJaZhao. All rights reserved.
//

import UIKit
import SJRingViewKitSwift

class ViewController: UIViewController {
    var timer:Timer = Timer()
    
    var progress:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ringView = SJRingViewKit(ringWidth: 3, ringColor: UIColor.red)
        ringView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.view.addSubview(ringView)
        
        if #available(iOS 10.0, *) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
                if (self.progress > 1.0) {
                    self.progress = 0.0
                } else {
                    self.progress = self.progress + 0.001
                    ringView.drawRing(progress: self.progress)

                }
                
            })
        } else {
            // Fallback on earlier versions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

