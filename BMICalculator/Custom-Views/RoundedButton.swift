//
//  RoundedButton.swift
//  shahreman
//
//  Created by Behnam on 8/4/20.
//  Copyright © 2020 Behnam Rakhshani. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    
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
