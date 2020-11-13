//
//  Animations.swift
//  Quiz
//
//  Created by Behnam on 4/2/20.
//  Copyright © 2020 Behnam. All rights reserved.
//

import UIKit


class Animations {
    
    static func fadeIn(on onView:UIView, duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
         UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
             onView.alpha = 1.0
     }, completion: completion)  }

    static func fadeOut(on onView:UIView, duration: TimeInterval = 0.3, delay: TimeInterval =  0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
         UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
             onView.alpha = 0.0
     }, completion: completion)}
    
    static func shake(on onView: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: onView.center.x - 10, y: onView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: onView.center.x + 10, y: onView.center.y))
        onView.layer.add(animation, forKey: "position")
    }
    
    static func zoomIn(on onView: UIView) {
        onView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.8),
                       initialSpringVelocity: CGFloat(2.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        onView.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
    }
    
}
