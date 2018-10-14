//
//  DoubleExtension.swift
//  WeatherApp
//
//  Created by FAB on 10/14/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

extension Double {
    
    func convertToString(placeOfDecimal: Int) -> String{
        
        return String(format:"%.\(placeOfDecimal)f", self)
    }
}
