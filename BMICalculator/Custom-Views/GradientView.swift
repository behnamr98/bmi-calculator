//
//  GradientView.swift
//  CollectionViewPagingLayout
//
//  Created by Amir on 15/02/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    // MARK: Properties
    
    override class var layerClass: Swift.AnyClass {
        CAGradientLayer.self
    }
    
    override var layer: CAGradientLayer {
        (super.layer as? CAGradientLayer)!
    }
    
    
    // MARK: Public functions
    
    public func set(colors: [UIColor] = [#colorLiteral(red: 0.5024486184, green: 0.8365812898, blue: 0.992510736, alpha: 1) , #colorLiteral(red: 0.2607318163, green: 0.5119681954, blue: 0.9391750693, alpha: 1)]) {
        backgroundColor = .clear
        layer.colors = colors.map { $0.cgColor }
    }
    
    public func set(startPoint: CGPoint, endPoint: CGPoint) {
        layer.startPoint = startPoint
        layer.endPoint = endPoint
    }
    
}
