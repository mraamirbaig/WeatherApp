//
//  CommonFunctions.swift
//  WeatherApp
//
//  Created by FAB on 10/14/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

class CommonFunctions {
    
    static func convertToCelsius(fahrenheit: Double) -> Double {
        return 5.0 / 9.0 * (fahrenheit - 32.0)
    }
    
    static func convertToFahrenheit(celsius: Double) -> Double {
        return celsius * 9 / 5 + 32
    }
}
