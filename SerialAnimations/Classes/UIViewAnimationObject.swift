//
//  UIViewAnimationObject.swift
//  ZXKJ_iOS
//
//  Created by Mr.Wang on 2019/12/20.
//  Copyright © 2019 Mr.Wang. All rights reserved.
//

import UIKit

public class UIViewAnimationObject: NSObject {

    let duration: TimeInterval
    let delay: TimeInterval
    let damping: CGFloat
    let velocity: CGFloat
    let options: UIView.AnimationOptions
    let animations: () -> ()
    
    init(duration: TimeInterval = 0,
         delay: TimeInterval = 0,
         damping: CGFloat = 1,
         velocity: CGFloat = 0,
         options: UIView.AnimationOptions = .curveEaseInOut,
         animations: @escaping () -> () = {}) {
        
        self.duration = duration
        self.delay = delay
        self.damping = damping
        self.velocity = velocity
        self.options = options
        self.animations = animations
    }
    
}

extension UIView {
    
    static func playAnimation(_ animtaion: UIViewAnimationObject, complete: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: animtaion.duration, delay: animtaion.delay, usingSpringWithDamping: animtaion.damping, initialSpringVelocity: animtaion.velocity, options: animtaion.options, animations: {
            animtaion.animations()
        }) { (bool) in
            complete(bool)
        }
    }
    
    static func playAnimations(_ animtaions: [UIViewAnimationObject], complete: @escaping () -> ()) {
        guard let animation = animtaions.first else {
            complete()
            return
        }
        UIView.playAnimation(animation) { (_) in
            var tmpAnimations = animtaions
            tmpAnimations.removeFirst()
            UIView.playAnimations(tmpAnimations, complete: {
                complete()
            })
        }
    }
    
}
