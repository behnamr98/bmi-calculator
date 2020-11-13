//
//  RoundedView.swift
//  BMICalculator
//
//  Created by Behnam on 11/12/20.
//  Copyright © 2020 BehnamR. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    
    
    @IBInspectable var radius:CGFloat = 8
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        
        
    }
    
}
