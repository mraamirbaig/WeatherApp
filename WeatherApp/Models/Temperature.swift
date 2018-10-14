//
//  Temperature.swift
//  WeatherApp
//
//  Created by FAB on 10/14/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

struct Temperature {
    
    var degree: Double
    var type: AppConstants.TEMPERATURE_TYPE
    
    init(degree: Double, type: AppConstants.TEMPERATURE_TYPE) {
        self.degree = degree
        self.type = type
    }
    
    func convertToString() -> String {
        
        if self.type == AppConstants.TEMPERATURE_TYPE.FAHRENHEIT {
            return degree.convertToString(placeOfDecimal: 2) + "° F"
        }else {
            return degree.convertToString(placeOfDecimal: 2) + "° C"
        }
    }
}
