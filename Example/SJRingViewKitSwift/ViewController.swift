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
        
        ringView.drawRing(progress: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

