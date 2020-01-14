//
//  UIViewAnimationType.swift
//  ZXKJ_iOS
//
//  Created by Mr.Wang on 2019/12/20.
//  Copyright © 2019 Mr.Wang. All rights reserved.
//

import UIKit

public enum UIViewAnimationType {
    case frame(CGRect)
    case transform(CGAffineTransform)
    case backgroundColor(UIColor)
    case alpha(CGFloat)
    case x(CGFloat)
    case y(CGFloat)
    case width(CGFloat)
    case height(CGFloat)
    case size(CGSize)
    case cornerRadius(CGFloat)
    case contentOffset(CGPoint)
}

extension UIViewAnimationType {
    
    public var animation: (UIView?) -> () {
        switch self {
        case .frame(let frame):
            return { $0?.frame = frame }
            
        case .transform(let transform):
            return { $0?.transform = transform }
            
        case .backgroundColor(let backgroundColor):
            return { $0?.backgroundColor = backgroundColor }
            
        case .alpha(let alpha):
            return { $0?.alpha = alpha }
            
        case .x(let x):
            return { $0?.x = x }
            
        case .y(let y):
            return { $0?.y = y }
            
        case .width(let width):
            return { $0?.width = width }
            
        case .height(let height):
            return { $0?.height = height }
            
        case .size(let size):
            return { $0?.size = size }
            
        case .cornerRadius(let cornerRadius):
            return { $0?.layer.cornerRadius = cornerRadius }
            
        case .contentOffset(let contentOffset):
            return { ($0 as? UIScrollView)?.contentOffset = contentOffset }
        }
    }
    
}
