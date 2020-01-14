//
//  UIViewAnimationProvider.swift
//  ZXKJ_iOS
//
//  Created by Mr.Wang on 2019/12/20.
//  Copyright © 2019 Mr.Wang. All rights reserved.
//

import UIKit

private var UIViewAnimationKey = "UIViewAnimationKey"

public extension UIView {
    
    var animations: [UIViewAnimationObject]? {
        set {
            objc_setAssociatedObject(self, &UIViewAnimationKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, &UIViewAnimationKey) as? [UIViewAnimationObject]
        }
    }
    
    func prepareForAnimate() -> UIView {
        self.animations = []
        return self
    }
    
    func playAnimate(complete: @escaping () -> () = { }) {
        UIView.playAnimations(self.animations ?? []) {
            complete()
        }
    }
    
    func animation(_ animation: UIViewAnimationType,
                           duration: TimeInterval,
                           delay: TimeInterval = 0,
                           damping: CGFloat = 1,
                           velocity: CGFloat = 0,
                           options: UIView.AnimationOptions = .curveEaseInOut) -> UIView {
        let animate = UIViewAnimationObject.init(duration: duration, delay: delay, damping: damping, velocity: velocity, options: options) { [weak self] in
            animation.animation(self)
        }
        self.animations?.append(animate)
        return self
    }
    
    func animation(_ animations: [UIViewAnimationType],
                           duration: TimeInterval,
                           delay: TimeInterval = 0,
                           damping: CGFloat = 1,
                           velocity: CGFloat = 0,
                           options: UIView.AnimationOptions = .curveEaseInOut) -> UIView {
        let animate = UIViewAnimationObject.init(duration: duration, delay: delay, damping: damping, velocity: velocity, options: options) { [weak self] in
            animations.forEach { (type) in
                type.animation(self)
            }
        }
        self.animations?.append(animate)
        return self
    }
    
}
