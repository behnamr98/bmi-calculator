//
//  Extensions.swift
//  BMICalculator
//
//  Created by Behnam on 11/13/20.
//  Copyright © 2020 BehnamR. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setContentInset(value:CGFloat) {
        self.contentEdgeInsets = UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension Double{
    func integerPart()->String{
        let result = floor(abs(self)).description.dropLast(2).description
        let plusMinus = self < 0 ? "-" : ""
        return  plusMinus + result
    }
    func fractionalPart(_ withDecimalQty:Int = 2)->String{
        let valDecimal = self.truncatingRemainder(dividingBy: 1)
        let formatted = String(format: "%.\(withDecimalQty)f", valDecimal)
        let dropQuantity = self < 0 ? 3:2
        return formatted.dropFirst(dropQuantity).description
    }
    
}

