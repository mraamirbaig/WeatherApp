//
//  AppConstants.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

class AppConstants {
    
    
    static let DARKSKY_API_KEY = "b1b4beb010f9147963bd803fb9bbd9ae"
    
    struct BaseUrls {
        
        static let DARKSKY_API_BASE_URL = "https://api.darksky.net/forecast/"
    }
    
    enum TEMPERATURE_TYPE: String {
        
        case FAHRENHEIT = "Fahrenheit"
        case CELSIUS = "Celsius"
    }
}
