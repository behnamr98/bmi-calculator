//
//  Calculator.swift
//  BMICalculator
//
//  Created by Behnam on 11/13/20.
//  Copyright © 2020 BehnamR. All rights reserved.
//

import Foundation

class Calculator:NSObject {
    
    
    private var height:Double!
    private var weight:Double!
    
    init(height:Double, weight:Double) {
        
        self.height = height
        self.weight = weight
    }
    
    func getBMI() -> Double{
        return weight / pow(height/100, 2)
    }
    
    func getMinNormalWeight() -> Double {
        return 18.5 * pow(height/100, 2)
    }
    
    func getMaxNormalWeight() -> Double {
        return 25 * pow(height/100, 2)
    }
    
}
