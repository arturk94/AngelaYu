//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Artur KNOTHE on 13/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var total: Float
    var tipSelected: Float
    
    mutating func setTotal(bill: Float, tip: Float, split: Float) {
        
        total = (bill * ((100.0 + tip) / 100.0))  / split
    }
    
    func getTotal() -> Float {
        return total
    }
    
    func getTipSelected() -> Float {
        return tipSelected
    }
    
}
