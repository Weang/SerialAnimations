//
//  ViewController.swift
//  SerialAnimations
//
//  Created by w704444178@qq.com on 01/08/2020.
//  Copyright (c) 2020 w704444178@qq.com. All rights reserved.
//

import UIKit
import SerialAnimations

class ViewController: UIViewController {

    let redView = UIView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .red
        self.view.addSubview(redView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.redView.prepareForAnimate()
            .animation(.alpha(0.5), duration: 0.5)
            .animation(.alpha(1), duration: 0.5)
            .animation(.contentOffset(CGPoint.zero), duration: 3)
            .animation(.y(200), duration: 0.4)
            .animation(.x(150), duration: 0.4)
            .animation(.transform(.init(scaleX: 2.0, y: 2.0)), duration: 5, damping: 0.2, velocity: 10)
            .animation(.backgroundColor(.black), duration: 0.4)
            .animation(.y(300), duration: 0.4)
            .animation(.x(1), duration: 0.4)
            .animation(.x(100), duration: 0.4)
            .animation([.backgroundColor(.red), .transform(.init(scaleX: 1.0, y: 1.0))], duration: 5, damping: 0.2, velocity: 10)
            .playAnimate()
    }

}

